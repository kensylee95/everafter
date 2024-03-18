import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:remind_me/models/profile/filter_model/filter_model.dart';
import 'package:remind_me/models/user_model.dart';
import 'package:remind_me/models/user_photo_model.dart';

class UserRepo extends GetxController {
  static UserRepo get instance => Get.find();
  dynamic errors;
  final _db = FirebaseFirestore.instance;
  createUser(UserModel user) async {
    await _db
        .collection("Users")
        .add(user.toJson())
        .whenComplete(() => true)
        .catchError((e, stackTrace) => errors = e);
  }

  Future<QuerySnapshot<Map<String, dynamic>>> queryUsers(
      {String? email}) async {
    if (email != null) {
      QuerySnapshot<Map<String, dynamic>> query =
          await _db.collection("Users").where("email", isEqualTo: email).get();
      return query;
    }
    return await _db.collection("Users").get();
  }

  Future<UserModel?> getUserDetails(String email) async {
    try {
      final query = await queryUsers(email: email);
      final userData = query.docs
          .map(
            (e) => UserModel.fromJson(e.id, e.data()),
          )
          .single;
      return userData;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<List<UserModel>> allUserDetails() async {
    QuerySnapshot<Map<String, dynamic>> query = await queryUsers();
    final userData = query.docs
        .map(
          (e) => UserModel.fromJson(e.id, e.data()),
        )
        .toList();
    return userData;
  }

  //fetch user address
  Future getUserById(String userId) async {
    final userData =
        await _db.collection("Users").where("id", isEqualTo: userId).get();

    UserModel userModel =
        UserModel.fromJson(userId, userData.docs.single.data());
    return userModel;
  }

  //fetch user address
  Future userAddress(String userId) async {
    UserModel user = await getUserById(userId);
    return user.address;
  }

  //fetch all users that not loggedinuser
  Future<List<UserModel>> userMatches(UserModel user) async {
    final QuerySnapshot<Map<String, dynamic>> query = await _db
        .collection("Users")
        //so that user record is not included
        .where(
          'id',
          isNotEqualTo: user.id,
        )
        .get();
    final List<UserModel> userModels = query.docs
        .map((e) => UserModel.fromJson(e.data()["id"], e.data()))
        .toList();
    return userModels;
  }

  checkIfEmailExists(String email) async {
    final QuerySnapshot<Map<String, dynamic>> checkEmail =
        await queryUsers(email: email);
    return checkEmail.docs.isNotEmpty;
  }

  Future addInterests(List<String> interest, UserModel userData) async {
    return await _db
        .collection("Users")
        .doc(userData.id)
        .update({
          "interests": interest,
        })
        .whenComplete(() => true)
        .catchError((e, stackTrace) => errors = e);
  }

  /*Future addPreferredAgeRangeAndGender(
      String userId, UserModel userData, FilterModel filterModel) async {
    return await _db
        .collection("Users")
        .doc(userId)
        .update({
          ...userData
              .toJson(), //<--- include save empty filter model for this user  --->
          "filterModel": filterModel.toJson().map((key, value) => MapEntry(key, value.toJson())),
        })
        .whenComplete(() => true)
        .catchError((e, stackTrace) => print(e));
  }*/
 Future updateUserFilter(
      String userId, FilterModel? filterModel) async {
    return await _db
        .collection("Users")
        .doc(userId)
        .update({ 
          //<--- save Filter everytime user updates there filter  --->
          "filterModel": filterModel?.toJson(),
        })
        .whenComplete(() => true)
        .catchError((e, stackTrace) => print(e));
  }



 /* Future addDobAndUserGender(String? userId, Map<String, dynamic> userData) async {
    return await _db
        .collection("Users")
        .doc(userId)
        .update(userData)
        .whenComplete(() => true)
        .catchError((e, stackTrace) =>print(e));
  }*/

  Future addUserImageModels(
      UserModel userModel, List<UserPhotoModel> userPhotos) async {
    return await _db
        .collection("Users")
        .doc(userModel.id)
        .update(
          {
            "photos": userPhotos
                .map(
                  (photoModel) => photoModel.toJson(),
                )
                .toList(),
            "totalPictures": userPhotos.length,
          },
        )
        .whenComplete(() => true)
        .catchError((e, stackTrace) => print(e));
  }
   Future updateUserdata(UserModel userData) async {
    return await _db
        .collection("Users")
        .doc(userData.id)
        .set(userData.toJson())
        .whenComplete(() => true)
        .catchError((e, stackTrace) => print(e));
  }
}
