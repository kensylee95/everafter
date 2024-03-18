import 'dart:async';

import 'package:awesome_select/awesome_select.dart';
import 'package:get/get.dart';
import 'package:remind_me/controllers/location_controller.dart';
import 'package:remind_me/models/profile/filter_model/filter_model.dart';
import 'package:remind_me/models/user_address.dart';
import 'package:remind_me/models/user_model.dart';
import 'package:remind_me/repositories/auth_repo.dart';
import 'package:remind_me/repositories/auth_repository/location_repo.dart';
import 'package:remind_me/repositories/user_repo.dart';

class FilterController extends GetxController {
  FilterController({this.userDataModel});
  static FilterController get instance => Get.find();
  final LocationController locationController = Get.put(LocationController());
  final AuthRepo authRepo = Get.put(AuthRepo());
  final LocationRepo _locationRepo = Get.put(LocationRepo());
  UserModel? userDataModel;
  final UserRepo userRepo = Get.put(UserRepo());
  late FilterModel? userFilterModel;
  //all users with current logged in user excluded
  List<UserModel> userMatches = [];
  //number of photos prefered by user; default is
  final preferedNoOfPhotos = 9.obs;
  //if user is premium user
  final RxBool isPremiumUser = false.obs;
  //maximum interest a user would have with current authenticated user before user is considered mutual
  final int maxSharedMutualInterest = 3;
  //matched user distance from user list
  List<UserAddress> matchedUsersAddress = [];
  bool isLoading = true;

  //user address
  UserAddress? userAddress;

  @override
  void onInit() async {
    userDataModel = userDataModel ??
        await userRepo.getUserDetails(AuthRepo.instance.firebaseUser!.email!);
    super.onInit();
  }

  @override
  onReady() async {
    userFilterModel = userDataModel!.filterModel;
    update(["photo-number"]);
    preferedNoOfPhotos.value =
        userDataModel!.filterModel?.filterNumberOfPhotos ?? 9;
    isPremiumUser.value = userDataModel!.isPremiumUser;
    //get user current address
    userAddress = await locationController.fetchFullAddress(userDataModel!);
    //save the location to database
    _locationRepo.updateUserLocationData(userDataModel!.id!, userAddress);
    //Fetch users that are not current logged in user.
    userMatches = await userRepo.userMatches(userDataModel!);
    //add them to our matched list of models
    debounce(preferedNoOfPhotos, (_) async {
      await userRepo.updateUserdata(userDataModel!);
    }, time: const Duration(seconds: 1));
    isLoading = false;
  }
// Only for premium users
updatePreferredNoPhotos(double value) async {
  userDataModel?.filterModel?.filterNumberOfPhotos = value.toInt();
  preferedNoOfPhotos.value = userDataModel?.filterModel?.filterNumberOfPhotos ?? 0;
}


 updateUserAppearanceFilter(String typeOf, S2MultiSelected<String> changedValue) async {
  final List<String> values = changedValue.choice!.map((choice) => choice.value).toList();
  switch (typeOf) {
    case "body style":
      userFilterModel?.filterAppearance?.bodyType?.assignAll(values);
      break;
    case "ethnicity":
      userFilterModel?.filterAppearance?.ethnicity?.assignAll(values);
      break;
    case "eye color":
      userFilterModel?.filterAppearance?.eyeColor?.assignAll(values);
      break;
    case "hair color":
      userFilterModel?.filterAppearance?.hairColor?.assignAll(values);
      break;
    default:
      return; // Exit early if typeOf is unknown
  }
  
  await userRepo.updateUserFilter(userDataModel!.id!, userFilterModel);
  update([typeOf]);
}


  updateUserLifeStyleFilter(String typeOf, S2MultiSelected<String> changedValue) async {
  if (userFilterModel == null || userDataModel == null) return;

  List<String>? values = changedValue.choice?.map((choice) => choice.value).toList();
  if (values == null) return;

  switch (typeOf) {
    case "drinking habit":
      userFilterModel!.filterLifeStyles?.doYouDrink?.assignAll(values);
      break;
    case "smoking habit":
      userFilterModel!.filterLifeStyles?.doYouSmoke?.assignAll(values);
      break;
    case "employment":
      userFilterModel!.filterLifeStyles?.employmentStatus?.assignAll(values);
      break;
    default:
      return;
  }

  await userRepo.updateUserFilter(userDataModel!.id!, userFilterModel);
  update([typeOf]);
}

  Future<void> updateUserBackgroundValuesFilter(String typeOf, S2MultiSelected<String> changedValue) async {
  if (userFilterModel == null) return;

  List<String>? values = changedValue.choice?.map((choice) => choice.value).toList();

  if (values == null || values.isEmpty) return;

  switch (typeOf) {
    case "education":
      userFilterModel!.filterCulturalValues?.education?.assignAll(values);
      break;
    case "religion":
      userFilterModel!.filterCulturalValues?.religion?.assignAll(values);
      break;
    case "star sign":
      userFilterModel!.filterCulturalValues?.starSign?.assignAll(values);
      break;
    default:
      return;
  }

  await userRepo.updateUserFilter(userDataModel!.id!, userFilterModel);
  update([typeOf]);
}


double? findDistanceFromUser(String id) {
  UserAddress? address =
      matchedUsersAddress.firstWhereOrNull((address) => address.id == id);
  if (address == null) {
    return null; // Address not found
  }
  return address.distanceFromUser?.ceilToDouble();
}


//<---------------------- Filtering each user model ------------------------>
  // get list of users and find perfect users list of matches for loggedInUsers
 Future<List<UserModel?>> findUserMatches(UserModel userData) async {
  // Fetch user matches from repository
  List<UserModel> userModels = await userRepo.userMatches(userData);
  // Get the logged-in user data
  UserModel loggedinUser = userData;

  // List to store filtered user models
  List<UserModel> filteredUsers = [];

  // Iterate through each user model in the user matches
  for (UserModel selectedUser in userModels) {
    // Check if the selected user is within the location range of the logged-in user
    bool isInLocationRange = await isWithinLocationRange(
      user: selectedUser,
      userAddressOfAuthUser: await locationController.fetchFullAddress(userData),
      loggedInUserDistanceFilter: userData.distanceToFilter ?? 1,
    );
    // Check if the selected user falls within the age range specified by the logged-in user
    bool isInAgeRange = isWithinAgeRange(
      user: selectedUser,
      minAge: loggedinUser.minAge!,
      maxAge: loggedinUser.maxAge!,
    );
    // Check if the selected user falls within the preferred gender of the logged-in user
    bool isWithinPrefGender = isWithinPreferedGender(
      selectedUser,
      userData.genderInterestIndex!,
    );
    // Check if the selected user has mutual interests with the logged-in user
    UserModel? hasMutualInterestWithUser = modelIsWithMutualInterests(
      user: selectedUser,
      loggedinUserInterestList: loggedinUser.interests!,
    );

    // If the selected user meets the criteria, add them to the filtered list
    if (isInLocationRange &&
        isWithinPrefGender &&
        (hasMutualInterestWithUser != null || isInAgeRange)) {
      filteredUsers.add(selectedUser);
    }
  }

  // Return the filtered list of user models
  return filteredUsers;
}


//<---------------------- End of matching loop------------------------>

//<---------------------- Filter Functions begin here------------------------>

  //<----------------------1. Mutual interest filter -------------------------->
  //<--- function that check if user has enough mutual interest with logged in user --->
 UserModel? modelIsWithMutualInterests({
  required UserModel user,
  required List<String> loggedinUserInterestList,
  int maxSharedMutualInterest = 3,
}) {
  // Check if user's interests are available
  if (user.interests == null || user.interests!.isEmpty) {
    return null; // No interests to compare, return null
  }

  // Convert user's interests to a set for faster containment checks
  final userInterestsSet = user.interests!.toSet();

  // Initialize the count of mutual interests
  var numberOfCommonInterests = 0;

  // Iterate over the interests of the logged-in user
  for (final interest in loggedinUserInterestList) {
    // Check if the current interest is shared by the user
    if (userInterestsSet.contains(interest)) {
      // Increment the count of mutual interests
      numberOfCommonInterests++;

      // Check if the count exceeds the threshold
      if (numberOfCommonInterests > maxSharedMutualInterest) {
        return user; // Return the user if threshold is met
      }
    }
  }

  // Return null if no user with enough shared interests is found
  return null;
}


  bool isWithinAgeRange({
  required UserModel user,
  required int minAge,
  required int maxAge,
}) {
  final age = user.age ?? 0; // If user.age is null, default to 0 (you can choose another default if needed)
  return age >= minAge && age <= maxAge;
}
  //<---------------------- 3. Location Range Filter -------------------------->
 Future<bool> isWithinLocationRange({
  required UserModel user,
  required UserAddress userAddressOfAuthUser,
  required int loggedInUserDistanceFilter,
}) async {
  // Fetch the address of the external user
  final UserAddress? userAdressOfExternalUser =
      await userRepo.userAddress(user.id!);

  // If the external user's address is null, return false
  if (userAdressOfExternalUser == null) {
    return false;
  }

  // Calculate the distance between the authenticated user and the external user
  final double distanceFromUser = locationController.distanceApart(
    userAddressOfAuthUser.latitude,
    userAddressOfAuthUser.longitude,
    userAdressOfExternalUser.latitude,
    userAdressOfExternalUser.longitude,
  );

  // Convert the logged-in user's distance filter from meters to miles
  final double distanceFilterInMiles = loggedInUserDistanceFilter / 1609;

  // Check if the distance is within the specified range
  if (distanceFromUser <= distanceFilterInMiles) {
    // If the user is within the range, add the user's address to the list of matched users
    matchedUsersAddress.add(
      UserAddress(id: user.id, distanceFromUser: distanceFromUser),
    );
    return true; // Return true if the user is within the range
  } else {
    return false; // Return false if the user is not within the range
  }
}


  //<----------------------4. Preferred gender filter-------------------------->
  //<--- user has gender preferred by loggedinuser --->
// Function to check if the user's preferred gender matches with the given index or if the index represents "both" genders
bool isWithinPreferedGender(UserModel user, int preferedGenderIndex) {
// Check if the user's preferred gender matches with the given index or if the index represents "both" genders
    return preferedGenderIndex == user.genderId || preferedGenderIndex == 2;
}

  
//<-----------------------Advanced filters----------------------------------->
List<UserModel> advancedFilteredModel = [];
void advancedFilter(UserModel userData, List<UserModel> matchedUsers) {
  // Retrieve the filter model from the user data
  FilterModel userFilterModel = userData.filterModel!;

  // Iterate over each matched user
  for (UserModel matchedPerson in matchedUsers) {
    // Extract appearance, lifestyle, and cultural values from the matched user
    var appearance = matchedPerson.userProperties?.appearance;
    var lifestyle = matchedPerson.userProperties?.lifeStyle;
    var culturalValues = matchedPerson.userProperties?.culturalValues;

    // Check if the appearance of the user matches the filter criteria
    var matchedAppearance = appearance != null &&
        userFilterModel.filterAppearance != null &&
        userFilterModel.filterAppearance!.bodyType!.contains(appearance.bodyType) &&
        userFilterModel.filterAppearance!.ethnicity!.contains(appearance.ethnicity) &&
        userFilterModel.filterAppearance!.eyeColor!.contains(appearance.eyeColor) &&
        userFilterModel.filterAppearance!.hairColor!.contains(appearance.hairColor);

    // Check if the lifestyle of the user matches the filter criteria
    var matchedLifestyle = lifestyle != null &&
        userFilterModel.filterLifeStyles != null &&
        userFilterModel.filterLifeStyles!.doYouDrink!.contains(lifestyle.doYouDrink) &&
        userFilterModel.filterLifeStyles!.doYouSmoke!.contains(lifestyle.doYouSmoke) &&
        userFilterModel.filterLifeStyles!.employmentStatus!.contains(lifestyle.employmentStatus);

    // Check if the cultural values of the user match the filter criteria
    var matchedCulturalValues = culturalValues != null &&
        userFilterModel.filterCulturalValues != null &&
        userFilterModel.filterCulturalValues!.education!.contains(culturalValues.education) &&
        userFilterModel.filterCulturalValues!.religion!.contains(culturalValues.religion) &&
        userFilterModel.filterCulturalValues!.starSign!.contains(culturalValues.starSign);

    // If all criteria are matched, add the user to the filtered list
    if (matchedAppearance && matchedLifestyle && matchedCulturalValues) {
      advancedFilteredModel.add(matchedPerson);
    }
  }
}

//<--------------------- End advanced filter ------------------------------>

  @override
  void dispose() {
    matchedUsersAddress.addAll([]);
    super.dispose();
  }
}
