// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAddress _$UserAddressFromJson(Map<String, dynamic> json) => UserAddress(
      id: json['id'] as String?,
      distanceFromUser: (json['distanceFromUser'] as num?)?.toDouble(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      areaCouncil: json['areaCouncil'] as String?,
      city: json['city'] as String?,
      street: json['street'] as String?,
      country: json['country'] as String?,
      state: json['state'] as String?,
    );

Map<String, dynamic> _$UserAddressToJson(UserAddress instance) =>
    <String, dynamic>{
      'id': instance.id,
      'city': instance.city,
      'country': instance.country,
      'state': instance.state,
      'street': instance.street,
      'areaCouncil': instance.areaCouncil,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'distanceFromUser': instance.distanceFromUser,
    };
