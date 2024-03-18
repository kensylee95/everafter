// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_props.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProps _$UserPropsFromJson(Map<String, dynamic> json) => UserProps(
      appearance: json['appearance'] == null
          ? null
          : Appearance.fromJson(json['appearance'] as Map<String, dynamic>),
      culturalValues: json['culturalValues'] == null
          ? null
          : CulturalValues.fromJson(
              json['culturalValues'] as Map<String, dynamic>),
      lifeStyle: json['lifeStyle'] == null
          ? null
          : LifeStyle.fromJson(json['lifeStyle'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserPropsToJson(UserProps instance) => <String, dynamic>{
      'appearance': instance.appearance?.toJson(),
      'lifeStyle': instance.lifeStyle?.toJson(),
      'culturalValues': instance.culturalValues?.toJson(),
    };
