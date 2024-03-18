// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_created.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserCreated _$UserCreatedFromJson(Map<String, dynamic> json) => UserCreated(
      id: json['id'] as int,
      created: json['created'] as bool,
      username: json['username'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$UserCreatedToJson(UserCreated instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created': instance.created,
      'username': instance.username,
      'email': instance.email,
    };
