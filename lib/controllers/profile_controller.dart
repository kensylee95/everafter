import 'package:awesome_select/awesome_select.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:remind_me/models/profile/appearance.dart';
import 'package:remind_me/models/profile/cultural_values.dart';
import 'package:remind_me/models/profile/lifestyle.dart';
import 'package:remind_me/models/profile/user_props/user_props.dart';
import 'package:remind_me/models/user_model.dart';
import 'package:remind_me/models/user_photo_model.dart';
import 'package:remind_me/repositories/auth_repo.dart';
import 'package:remind_me/repositories/user_repo.dart';

class ProfileController extends GetxController {
  ProfileController get instance => Get.find();
  final activePhotoIndex = 0.obs;
  final activeIndexOfUserProps = 0.obs;
  PageController pageController = PageController();
  PageController pageController2 = PageController();
  Rx<UserModel?> userModel = Rx(null);

  @override
  void onInit() async {
    userModel.value = await UserRepo.instance
        .getUserDetails(AuthRepo.instance.firebaseUser!.email!);
    if (userModel.value?.userProperties == null) {
      final userProperties = UserProps(
          appearance: Appearance(
              hairColor: null,
              bodyArt: null,
              bodyType: null,
              ethnicity: null,
              eyeColor: null,
              height: null,
              weight: null),
          culturalValues: CulturalValues(
            education: null,
            religion: null,
            starSign: null,
          ),
          lifeStyle: LifeStyle(
            doYouDrink: null,
            doYouSmoke: null,
            employmentStatus: null,
            havePets: null,
            livingSituation: null,
            lookingFor: null,
          ));
      userModel.value?.userProperties = userProperties;
      UserRepo.instance.updateUserdata(userModel.value!);
    }
    super.onInit();
  }

  getSelectedItem(List<String?> list, String? item) {
    if (list.isEmpty||item==null) return;
    String? itemValue = list
        .where((string) => string!.toLowerCase() == item.toLowerCase())
        .firstOrNull;
        return itemValue;
  }
    updateUserDBDocument(UserModel userRecord) async {
      await UserRepo.instance.updateUserdata(userRecord);
    }

   updateUserCulturalValues(S2SingleSelected<String> selected,
      UserModel userModelData, String name) async {
    final String? selectedString = selected.choice?.value;
  
    switch (name) {
      case "education":
        userModelData.userProperties?.culturalValues?.education = selectedString;
        userModel.value = userModelData;
        updateUserDBDocument(userModel.value!);
        break;
      case "religion":
        userModelData.userProperties?.culturalValues?.religion = selectedString;
        userModel.value = userModelData;
        updateUserDBDocument(userModel.value!);
        break;
      case "star sign":
        userModelData.userProperties?.culturalValues?.starSign =
            selectedString;
        userModel.value = userModelData;
        updateUserDBDocument(userModel.value!);
        break;
     
      default:
    }
  }
  updateUserAppearance(S2SingleSelected<String> selected,
      UserModel userModelData, String name) async {
    final String? selectedString = selected.choice?.value;
  
    switch (name) {
      case "hair color":
        userModelData.userProperties?.appearance?.hairColor = selectedString;
        userModel.value = userModelData;
        updateUserDBDocument(userModel.value!);
        break;
      case "height":
        userModelData.userProperties?.appearance?.height = selectedString;
        userModel.value = userModelData;
        updateUserDBDocument(userModel.value!);
        break;
      case "body type":
        userModelData.userProperties?.appearance?.bodyType =
            selectedString;
        userModel.value = userModelData;
        updateUserDBDocument(userModel.value!);
        break;
      case "ethnicity":
        userModelData.userProperties?.appearance?.ethnicity = selectedString;
        userModel.value = userModelData;
        updateUserDBDocument(userModel.value!);
        break;
      case "eye color":
        userModelData.userProperties?.appearance?.eyeColor =
            selectedString;
        userModel.value = userModelData;
        updateUserDBDocument(userModel.value!);
        break;
      default:
    }
  }
  updateUserLifeStyle(S2SingleSelected<String> selected,
      UserModel userModelData, String name) async {
    final String? selectedString = selected.choice?.value;
  print(name);
    switch (name) {
      case "drinking habit":
        userModelData.userProperties?.lifeStyle?.doYouDrink = selectedString;
        userModel.value = userModelData;
        updateUserDBDocument(userModel.value!);
        break;
      case "smoking habit":
        userModelData.userProperties?.lifeStyle?.doYouSmoke = selectedString;
         userModel.value = userModelData;
        updateUserDBDocument(userModel.value!);
        break;
      case "home situation":
        userModelData.userProperties?.lifeStyle?.livingSituation =
            selectedString;
        userModel.value = userModelData;
        updateUserDBDocument(userModel.value!);
        break;
      case "have pets?":
        userModelData.userProperties?.lifeStyle?.havePets = selectedString;
        userModel.value = userModelData;
        updateUserDBDocument(userModel.value!);
        break;
      case "employment status":
        userModelData.userProperties?.lifeStyle?.employmentStatus =
            selectedString;
        userModel.value = userModelData;
        updateUserDBDocument(userModel.value!);
        break;
      default:
    }
  }

  int userProfilePhotoIndex(UserModel userModel) {
    int profilePhotoIndex =
        userModel.photos!.indexWhere((photoModel) => photoModel.isProfile);
    return profilePhotoIndex;
  }

  profileImageIndex(UserModel userDataModel) {
    UserPhotoModel profilePhotoModel = userDataModel.photos!
            .where((photoModel) => photoModel.isProfile)
            .firstOrNull ??
        userDataModel.photos![0];
    int indexOfUserProfileModel =
        userDataModel.photos!.indexOf(profilePhotoModel);
    return indexOfUserProfileModel;
  }
}
