// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_interactions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyInteractionsModel _$MyInteractionsModelFromJson(Map<String, dynamic> json) =>
    MyInteractionsModel(
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

Map<String, dynamic> _$MyInteractionsModelToJson(
        MyInteractionsModel instance) =>
    <String, dynamic>{
      'likedIds': instance.likedIds,
      'favoritedIds': instance.favoritedIds,
      'dislikedIds': instance.dislikedIds,
      'blockedIds': instance.blockedIds,
    };
