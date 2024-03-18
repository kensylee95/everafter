import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' as img;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:remind_me/constants/colors.dart';
import 'package:remind_me/controllers/moderator/image_classifier_controller.dart';
import 'package:remind_me/models/user_model.dart';
import 'package:remind_me/models/user_photo_model.dart';
import 'package:remind_me/repositories/auth_repo.dart';
import 'package:remind_me/repositories/files_repo.dart';
import 'package:remind_me/repositories/user_repo.dart';

class ImageUploadController extends GetxController {
  static ImageUploadController get instance => Get.find();
  FilesRepo filesRepo = Get.put(FilesRepo());
  final UserRepo _userRepo = Get.put(UserRepo());
  final AuthRepo _authRepo = Get.put(AuthRepo());
  dynamic pickImageError;
  double progress = 0;
  bool isImage = false;
  final ImagePicker picker = ImagePicker();
  final ImageClassifierController imageClassifier = Get.put(ImageClassifierController());
  final double maxImageHeight = 800.0;
  final double maxImageWidth = 800.0;
  final int imageQuality = 75;
  final int allowedUpload = 9;
  final int minimumAllowed = 2;
  XFile? selectedProfileImage;
  bool isLoading = false;
  List<XFile?> selectedImagesFile = [];
  SnackbarController? exceededMaximumSnackbar;
  // late SharedPreferences prefs;
  //text to show in loading widget
  String? loadingText;
  //total uploaded
  int uploadedCount = 0;
  bool isUploading = false;
  //<--- //List of UserPhotoModel saved in users as reference to the uploaded images for a perticular user --->
  List<UserPhotoModel> listofPhotoModels = [];
  Rx<UserModel?> userModel = Rx(null);
  //user profile models
  RxList<UserPhotoModel?> profilePhotos = RxList<UserPhotoModel?>([]);
  @override
  void onInit() async {
    //  prefs = await SharedPreferences.getInstance();
    final User? user = AuthRepo.instance.firebaseUser;
    if (user != null) {
      UserModel? userRecord =
          await UserRepo.instance.getUserDetails(user.email!);
      userModel.value = userRecord;
      profilePhotos.value = userRecord!.photos!;
    }

    super.onInit();
  }

  Future<CroppedFile?> cropImage(
      String imagePath, int imageLength, int currentImageIndex) async {
    final CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imagePath,
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: 80,
      aspectRatio: const CropAspectRatio(ratioX: 9, ratioY: 16),
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Image Preview - $currentImageIndex/$imageLength',
          toolbarColor: primaryColor1,
          toolbarWidgetColor: primaryColor,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: true,
        ),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );
    return croppedFile;
  }
  
  checkIfImageIsNSFW(XFile image) async{
    String filePath = image.path;
    final bytes = await File(filePath).readAsBytes();
  final classified = imageClassifier.predictImage(img.decodeImage(bytes)!);
   print(classified.label);
  }
  Future pickMultipleImage(ImageSource source) async {
    try {
      isRequesting(true);
      List<XFile> pickedFile = await picker.pickMultiImage(
        maxWidth: maxImageWidth,
        maxHeight: maxImageHeight,
        imageQuality: imageQuality,
        requestFullMetadata: true,
      );
      pickedFile.length >= allowedUpload ||
              (selectedImagesFile.length == allowedUpload)
          ? Get.snackbar(
              "Maximum Reached", "Maximum of $allowedUpload images allowed")
          : null;

      if (pickedFile.isNotEmpty && selectedImagesFile.length < allowedUpload) {
        //allow user Crop selected images and return list of Xfiles
        List<XFile?> croppedPickedImages = [];
        for (XFile image in pickedFile) {
          checkIfImageIsNSFW(image);
          int currentImageIndex = pickedFile.indexOf(image);
          CroppedFile? croppedFile = await cropImage(
              image.path, pickedFile.length, currentImageIndex + 1);
          //if cropped file is null
          if (croppedFile == null) {
            break;
          }
          croppedPickedImages.add(XFile(croppedFile.path));
        }
        //if cropped image list is empty
        if (croppedPickedImages.isEmpty) {
          isRequesting(false);
          return null;
        }
        final int remainingAllowedImages =
            allowedUpload - selectedImagesFile.length;
        selectedImagesFile = [
          ...selectedImagesFile,
          ...croppedPickedImages.take(remainingAllowedImages)
        ];
        //set profile image
        selectedProfileImage = selectedProfileImage ?? selectedImagesFile[0];
      }
      isRequesting(
        false,
      );
      return pickedFile;
    } catch (e) {
      pickImageError = e;
    } finally {
      update();
    }
  }

  isRequesting(bool isOngoing, {String? text}) {
    isLoading = isOngoing;
    loadingText = text;
    update();
  }

  //add new photo when user want to update profile
  updateProfileImages(UserModel userModelData) async {
    await pickMultipleImage(ImageSource.gallery);
    await uploadImages(true);
  }

  //remove image from db
  removeImageFromDB(
      {required UserPhotoModel image, required UserModel userData}) {
    userData.photos!.remove(image);
    profilePhotos.value = [...userData.photos!];
    UserRepo.instance.updateUserdata(userData);
  }

  //update user profile
  void updateDbUserProfile(
      {required UserPhotoModel image, required UserModel userData}) {
    List<UserPhotoModel> updatedUserPhotoModel = userData.photos!.map((photo) {
      photo == image ? photo.isProfile = true : photo.isProfile = false;
      return photo;
    }).toList();
    profilePhotos.value = [...updatedUserPhotoModel];
    UserRepo.instance.updateUserdata(userData);
  }

  //remove images filed [only called during registration process]
  removeImage({XFile? image, int? index}) {
    if (image == selectedProfileImage) {
      final int indexOfprofileImage = selectedImagesFile.indexOf(image!);
      if (selectedImagesFile.last != image) {
        selectedProfileImage = selectedImagesFile[indexOfprofileImage + 1];
      }
      if (selectedImagesFile.last == image && selectedImagesFile.length > 1) {
        selectedProfileImage = selectedImagesFile[indexOfprofileImage - 1];
      }
    }
    selectedImagesFile.remove(image);
    update();
  }

  Future pickImagefromCamera(ImageSource source) async {
    try {
      XFile? pickedFile = await picker.pickImage(
        source: source,
        maxWidth: maxImageWidth,
        maxHeight: maxImageHeight,
        imageQuality: imageQuality,
        requestFullMetadata: true,
      );
      if (pickedFile != null) {
        selectedImagesFile = [...selectedImagesFile, pickedFile];
        update();
      }
      return pickedFile;
    } catch (e) {
      pickImageError = e;
    }
  }

  setAsProfileImage(XFile image) {
    selectedProfileImage = image;
    update();
  }

  isSelectedProfileImage(int index) {
    return selectedImagesFile[index] == selectedProfileImage;
  }

  String? getMimetype(path) {
    final String? mime = lookupMimeType(path);
    return mime;
  }

  bool isValidImage(int index) {
    final mime = getMimetype(selectedImagesFile[index]!.path);
    if ((mime == null || !mime.startsWith('image/'))) {
      //image is not supported
      return false;
    }
    //valid image
    return true;
  }

  uploadImages([bool? isUpdateProfile]) async {
    isRequesting(true, text: "uploading images...");
    //create list from selectedImagesFile keys
    List<int> selectedImagesFileKeyList =
        selectedImagesFile.asMap().keys.toList();
    //<--- create List of UserPhotoModel from uploaded picture urls and index --->
    List<UserPhotoModel>? generatedPhotoModelList = await Future.wait(
      //convert selected images list to UserModeList
      selectedImagesFileKeyList.toList().map(
        (index) async {
          uploadedCount = 0;
          //upload images to firebase storage and get the url
          String? imageUrl =
              await filesRepo.uploadImage(selectedImagesFile[index]!);
          uploadedCount++;
          loadingText =
              "Uploading $uploadedCount of ${selectedImagesFile.length}";
          update();

          //return user photo model
          final UserPhotoModel userPhotoModeldata = UserPhotoModel(
            id: index,
            link: imageUrl!,
            isProfile: isUpdateProfile == null && isUpdateProfile == false
                ? selectedProfileImage == selectedImagesFile[index]
                : false,
          );

          return userPhotoModeldata;
        },
      ).toList(),
    );

    if (userModel.value == null || generatedPhotoModelList.isEmpty) {
      //toggled loading and update UI
      isRequesting(false);
      update();
      return;
    }
    //list of photo to json
    List<UserPhotoModel> userPhotos = generatedPhotoModelList;
    //if user is not from update profile page && is new registration
    if (isUpdateProfile != null && isUpdateProfile == true) {
      //<--- store list of uploaded image urls to user record in database for later reference --->
      await _userRepo.addUserImageModels(userModel.value!, userPhotos);
    }

    //if user is from update profile page
    if (isUpdateProfile != null && isUpdateProfile == true) {
      //update user photos in database
      await _userRepo.addUserImageModels(userModel.value!,
          [...userModel.value!.photos!, ...generatedPhotoModelList]);
      //reset selected image file
      selectedImagesFile = [];
      //get and update userData
      userModel.value =
          await UserRepo.instance.getUserDetails(userModel.value!.email);
      profilePhotos.value = [...userModel.value!.photos!];
    }

    isRequesting(false);
    update();
    //if user is not from update profile page then setInitialScreen
    isUpdateProfile == null && isUpdateProfile == false
        ? await _authRepo.setInitialScreen(_authRepo.firebaseUser!)
        : null;
  }
}
