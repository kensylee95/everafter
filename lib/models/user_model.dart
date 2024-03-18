import 'package:json_annotation/json_annotation.dart';
import 'package:remind_me/models/my_interactions_model.dart';
import 'package:remind_me/models/profile/filter_model/filter_model.dart';
import 'package:remind_me/models/profile/user_props/user_props.dart';
import 'package:remind_me/models/user_address.dart';
import 'package:remind_me/models/user_photo_model.dart';
import 'package:remind_me/models/who_interacted_model.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel {
  String? id;
  final String email;
  int? genderId;
  DateTime? dob;
  int? age;
  final List<String>? interests;
  final double? minLocationRange;
  final double? maxLocationRange;
  int? minAge;
  int? maxAge;
  bool onlyUsersFromAgeRange=false;
  int? genderInterestIndex;
  List<UserPhotoModel>? photos;
  final int? totalPictures;
  String? bio;
  final String lastName;
  final String firstName;
  final String? password;
  final String? confirmationCode;
  final DateTime? confirmationTime;
  final String? phone;
  UserProps? userProperties;
  final UserAddress? address;
  MyInteractionsModel? myInteractions;
  WhoInteractedModel? whoInteracted;
  int? distanceToFilter;
  bool onlyUsesFromDistance;
  FilterModel? filterModel;
  bool isPremiumUser;

  UserModel({
    this.id,
    this.dob,
    this.interests,
    this.age,
    this.maxLocationRange,
    this.minLocationRange,
    this.minAge,
    this.maxAge,
    this.onlyUsersFromAgeRange=false,
    this.totalPictures,
    this.password,
    this.phone,
    this.distanceToFilter,
    this.onlyUsesFromDistance=false,
    this.genderInterestIndex,
    this.photos,
    required this.firstName,
    required this.email,
    this.genderId,
    required this.lastName,
    this.confirmationCode,
    this.confirmationTime,
    this.bio,
    this.address,
    this.userProperties,
    this.filterModel,
    this.isPremiumUser=false,
    this.myInteractions,
  });
  factory UserModel.fromJson(String id, Map<String, dynamic> json) =>
      _$UserModelFromJson(json)..id = id;

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
