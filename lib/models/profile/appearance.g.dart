// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appearance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Appearance _$AppearanceFromJson(Map<String, dynamic> json) => Appearance(
      hairColor: json['hairColor'] as String?,
      eyeColor: json['eyeColor'] as String?,
      height: json['height'] as String?,
      weight: json['weight'] as String?,
      bodyType: json['bodyType'] as String?,
      ethnicity: json['ethnicity'] as String?,
      bodyArt: json['bodyArt'] as String?,
    );

Map<String, dynamic> _$AppearanceToJson(Appearance instance) =>
    <String, dynamic>{
      'hairColor': instance.hairColor,
      'eyeColor': instance.eyeColor,
      'height': instance.height,
      'weight': instance.weight,
      'bodyType': instance.bodyType,
      'ethnicity': instance.ethnicity,
      'bodyArt': instance.bodyArt,
    };
