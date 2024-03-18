// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locality_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalityModel _$LocalityModelFromJson(Map<String, dynamic> json) =>
    LocalityModel(
      stateName: json['stateName'] as String?,
      country: json['country'] as String?,
      details: (json['details'] as List<dynamic>)
          .map((e) => ZipCodesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LocalityModelToJson(LocalityModel instance) =>
    <String, dynamic>{
      'stateName': instance.stateName,
      'country': instance.country,
      'details': instance.details,
    };
