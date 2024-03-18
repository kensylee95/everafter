// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as String?,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      interests: (json['interests'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      age: json['age'] as int?,
      maxLocationRange: (json['maxLocationRange'] as num?)?.toDouble(),
      minLocationRange: (json['minLocationRange'] as num?)?.toDouble(),
      minAge: json['minAge'] as int?,
      maxAge: json['maxAge'] as int?,
      onlyUsersFromAgeRange: json['onlyUsersFromAgeRange'] as bool? ?? false,
      totalPictures: json['totalPictures'] as int?,
      password: json['password'] as String?,
      phone: json['phone'] as String?,
      distanceToFilter: json['distanceToFilter'] as int?,
      onlyUsesFromDistance: json['onlyUsesFromDistance'] as bool? ?? false,
      genderInterestIndex: json['genderInterestIndex'] as int?,
      photos: (json['photos'] as List<dynamic>?)
          ?.map((e) => UserPhotoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstName: json['firstName'] as String,
      email: json['email'] as String,
      genderId: json['genderId'] as int?,
      lastName: json['lastName'] as String,
      confirmationCode: json['confirmationCode'] as String?,
      confirmationTime: json['confirmationTime'] == null
          ? null
          : DateTime.parse(json['confirmationTime'] as String),
      bio: json['bio'] as String?,
      address: json['address'] == null
          ? null
          : UserAddress.fromJson(json['address'] as Map<String, dynamic>),
      userProperties: json['userProperties'] == null
          ? null
          : UserProps.fromJson(json['userProperties'] as Map<String, dynamic>),
      filterModel: json['filterModel'] == null
          ? null
          : FilterModel.fromJson(json['filterModel'] as Map<String, dynamic>),
      isPremiumUser: json['isPremiumUser'] as bool? ?? false,
      myInteractions: json['myInteractions'] == null
          ? null
          : MyInteractionsModel.fromJson(
              json['myInteractions'] as Map<String, dynamic>),
    )..whoInteracted = json['whoInteracted'] == null
        ? null
        : WhoInteractedModel.fromJson(
            json['whoInteracted'] as Map<String, dynamic>);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'genderId': instance.genderId,
      'dob': instance.dob?.toIso8601String(),
      'age': instance.age,
      'interests': instance.interests,
      'minLocationRange': instance.minLocationRange,
      'maxLocationRange': instance.maxLocationRange,
      'minAge': instance.minAge,
      'maxAge': instance.maxAge,
      'onlyUsersFromAgeRange': instance.onlyUsersFromAgeRange,
      'genderInterestIndex': instance.genderInterestIndex,
      'photos': instance.photos?.map((e) => e.toJson()).toList(),
      'totalPictures': instance.totalPictures,
      'bio': instance.bio,
      'lastName': instance.lastName,
      'firstName': instance.firstName,
      'password': instance.password,
      'confirmationCode': instance.confirmationCode,
      'confirmationTime': instance.confirmationTime?.toIso8601String(),
      'phone': instance.phone,
      'userProperties': instance.userProperties?.toJson(),
      'address': instance.address?.toJson(),
      'myInteractions': instance.myInteractions?.toJson(),
      'whoInteracted': instance.whoInteracted?.toJson(),
      'distanceToFilter': instance.distanceToFilter,
      'onlyUsesFromDistance': instance.onlyUsesFromDistance,
      'filterModel': instance.filterModel?.toJson(),
      'isPremiumUser': instance.isPremiumUser,
    };
