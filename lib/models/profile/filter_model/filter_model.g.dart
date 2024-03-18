// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterModel _$FilterModelFromJson(Map<String, dynamic> json) => FilterModel(
      filterAppearance: json['filterAppearance'] == null
          ? null
          : FilterAppearance.fromJson(
              json['filterAppearance'] as Map<String, dynamic>),
      filterNumberOfPhotos: json['filterNumberOfPhotos'] as int?,
      filterLifeStyles: json['filterLifeStyles'] == null
          ? null
          : FilterLifeStyles.fromJson(
              json['filterLifeStyles'] as Map<String, dynamic>),
      filterCulturalValues: json['filterCulturalValues'] == null
          ? null
          : FilterCulturalValues.fromJson(
              json['filterCulturalValues'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FilterModelToJson(FilterModel instance) =>
    <String, dynamic>{
      'filterAppearance': instance.filterAppearance?.toJson(),
      'filterLifeStyles': instance.filterLifeStyles?.toJson(),
      'filterCulturalValues': instance.filterCulturalValues?.toJson(),
      'filterNumberOfPhotos': instance.filterNumberOfPhotos,
    };
