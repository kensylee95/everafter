import 'package:json_annotation/json_annotation.dart';
part 'user_address.g.dart';
@JsonSerializable(explicitToJson: true)
class UserAddress{
  final String? id;
  final String? city;
  final String? country;
  final String? state;
  final String? street ;
  final String? areaCouncil;
  final double? latitude;
  final double? longitude;
  final double? distanceFromUser;
  factory UserAddress.fromJson(Map<String, dynamic> json)=>_$UserAddressFromJson(json);

  UserAddress({this.id, this.distanceFromUser, this.latitude, this.longitude, this.areaCouncil,this.city, this.street, this.country, this.state});
  Map<String, dynamic> toJson()=>_$UserAddressToJson(this);
}