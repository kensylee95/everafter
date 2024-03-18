// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lifestyle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LifeStyle _$LifeStyleFromJson(Map<String, dynamic> json) => LifeStyle(
      doYouDrink: json['doYouDrink'] as String?,
      doYouSmoke: json['doYouSmoke'] as String?,
      maritalStatus: json['maritalStatus'] as String?,
      havePets: json['havePets'] as String?,
      occupation: json['occupation'] as String?,
      employmentStatus: json['employmentStatus'] as String?,
      livingSituation: json['livingSituation'] as String?,
      lookingFor: (json['lookingFor'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$LifeStyleToJson(LifeStyle instance) => <String, dynamic>{
      'doYouDrink': instance.doYouDrink,
      'doYouSmoke': instance.doYouSmoke,
      'maritalStatus': instance.maritalStatus,
      'havePets': instance.havePets,
      'occupation': instance.occupation,
      'employmentStatus': instance.employmentStatus,
      'livingSituation': instance.livingSituation,
      'lookingFor': instance.lookingFor,
    };
