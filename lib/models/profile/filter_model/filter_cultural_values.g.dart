// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_cultural_values.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterCulturalValues _$FilterCulturalValuesFromJson(
        Map<String, dynamic> json) =>
    FilterCulturalValues(
      education: (json['education'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      height:
          (json['height'] as List<dynamic>?)?.map((e) => e as String).toList(),
      religion: (json['religion'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      starSign: (json['starSign'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$FilterCulturalValuesToJson(
        FilterCulturalValues instance) =>
    <String, dynamic>{
      'education': instance.education,
      'height': instance.height,
      'religion': instance.religion,
      'starSign': instance.starSign,
    };
