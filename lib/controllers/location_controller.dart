
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:remind_me/models/locality_model.dart';
import 'package:remind_me/models/user_address.dart';
import 'package:remind_me/models/user_model.dart';
import 'package:remind_me/models/zip_codes_model.dart';
//import 'package:remind_me/repositories/auth_repo.dart';
//import 'package:remind_me/repositories/user_repo.dart';

class LocationController extends GetxController {
  static LocationController get instance => Get.find();
  late Position? currentLocation;
  late bool servicePermission = false;
  late LocationPermission permission;
  Placemark? placemark;
  String currentAddress = "";

  @override
  void onInit() async {
    super.onInit();
    //user = _authRepo.firebaseUser!;
    // userData = await _userRepo.getUserDetails(user!.email!);
    // print(userData!.id!);
    //try to get location data
    await getCurrentLocation();
    //get address from cordinates
    placemark = await getAddressFromCoordinates(
        latitude: currentLocation!.latitude,
        longitude: currentLocation!.longitude);
  }

  Future<Position?> getCurrentLocation() async {
    //check permission
    servicePermission = await Geolocator.isLocationServiceEnabled();
    if (!servicePermission) {
      // Get.snackbar("Location Dsabled", "Please enable location service");
    }
    //service is enabled
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    currentLocation = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    //update(["location"]);
    return currentLocation;
  }

  Future<Placemark?> getAddressFromCoordinates(
      {required double latitude, required double longitude}) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        latitude,
        longitude,
        localeIdentifier: "en",
      );
      return placemarks[0];
    } on PlatformException catch (error) {
      if (error.code == "IO_ERROR") {
           
      }
    } catch (error) {
      print(error);
    }
    return null;
  }

  double distanceApart(
      startLatitude, startLongitude, endLatitude, endLongitude) {
    return Geolocator.distanceBetween(
        startLatitude, startLongitude, endLatitude, endLongitude);
  }

  fetchCity(LocalityModel localityModel, String zipcode) {
    final ZipCodesModel? city = localityModel.details
        .where(
            (element) => element.zipCode.toLowerCase() == zipcode.toLowerCase())
        .firstOrNull;
    return city?.name;
  }

   fetchFullAddress(UserModel userData) async {
    final String id = userData.id!;
    final Position? location = await getCurrentLocation();
    final Placemark? addFromCod = await getAddressFromCoordinates(
        latitude: location!.latitude, longitude: location.longitude);
    final city = addFromCod?.locality ?? "unknown";
    UserAddress userAddress = UserAddress(
      id: id,
      city: city,
      country: addFromCod?.country ?? "unknown",
      state: addFromCod?.locality ?? "unknown",
      street: addFromCod?.street ?? "unknown",
      latitude: location.latitude,
      longitude: location.longitude,
      areaCouncil: addFromCod?.subAdministrativeArea ?? "unknown",
    );
    return userAddress;
  }
}
