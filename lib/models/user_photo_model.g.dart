// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_photo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPhotoModel _$UserPhotoModelFromJson(Map<String, dynamic> json) =>
    UserPhotoModel(
      id: json['id'] as int,
      link: json['link'] as String,
      isProfile: json['isProfile'] as bool,
    );

Map<String, dynamic> _$UserPhotoModelToJson(UserPhotoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'link': instance.link,
      'isProfile': instance.isProfile,
    };
