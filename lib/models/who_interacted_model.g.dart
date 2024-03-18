// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'who_interacted_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WhoInteractedModel _$WhoInteractedModelFromJson(Map<String, dynamic> json) =>
    WhoInteractedModel(
      likedIds:
          (json['likedIds'] as List<dynamic>).map((e) => e as String?).toList(),
      favoritedIds: (json['favoritedIds'] as List<dynamic>)
          .map((e) => e as String?)
          .toList(),
      dislikedIds: (json['dislikedIds'] as List<dynamic>)
          .map((e) => e as String?)
          .toList(),
      blockedIds: (json['blockedIds'] as List<dynamic>)
          .map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$WhoInteractedModelToJson(WhoInteractedModel instance) =>
    <String, dynamic>{
      'likedIds': instance.likedIds,
      'favoritedIds': instance.favoritedIds,
      'dislikedIds': instance.dislikedIds,
      'blockedIds': instance.blockedIds,
    };
