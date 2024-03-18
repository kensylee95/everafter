// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_appearance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterAppearance _$FilterAppearanceFromJson(Map<String, dynamic> json) =>
    FilterAppearance(
      hairColor: (json['hairColor'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      eyeColor: (json['eyeColor'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      height:
          (json['height'] as List<dynamic>?)?.map((e) => e as String).toList(),
      weight:
          (json['weight'] as List<dynamic>?)?.map((e) => e as String).toList(),
      bodyType: (json['bodyType'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      ethnicity: (json['ethnicity'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      bodyArt:
          (json['bodyArt'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$FilterAppearanceToJson(FilterAppearance instance) =>
    <String, dynamic>{
      'hairColor': instance.hairColor,
      'eyeColor': instance.eyeColor,
      'height': instance.height,
      'weight': instance.weight,
      'bodyType': instance.bodyType,
      'ethnicity': instance.ethnicity,
      'bodyArt': instance.bodyArt,
    };
