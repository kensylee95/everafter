import 'package:json_annotation/json_annotation.dart';
part 'user_photo_model.g.dart';
@JsonSerializable(explicitToJson: true)
class UserPhotoModel{
  final int id;
  final String link;
  bool isProfile;
  factory UserPhotoModel.fromJson(Map<String, dynamic> json)=>_$UserPhotoModelFromJson(json);

  UserPhotoModel({required this.id, required this.link, required this.isProfile});
  Map<String, dynamic> toJson()=>_$UserPhotoModelToJson(this);
}