// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_life_styles.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterLifeStyles _$FilterLifeStylesFromJson(Map<String, dynamic> json) =>
    FilterLifeStyles(
      doYouDrink: (json['doYouDrink'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      doYouSmoke: (json['doYouSmoke'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      maritalStatus: (json['maritalStatus'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      havePets: (json['havePets'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      occupation: (json['occupation'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      employmentStatus: (json['employmentStatus'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      livingSituation: (json['livingSituation'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      lookingFor: (json['lookingFor'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$FilterLifeStylesToJson(FilterLifeStyles instance) =>
    <String, dynamic>{
      'doYouDrink': instance.doYouDrink,
      'doYouSmoke': instance.doYouSmoke,
      'maritalStatus': instance.maritalStatus,
      'havePets': instance.havePets,
      'occupation': instance.occupation,
      'employmentStatus': instance.employmentStatus,
      'livingSituation': instance.livingSituation,
      'lookingFor': instance.lookingFor,
    };
