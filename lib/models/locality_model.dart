import 'package:json_annotation/json_annotation.dart';
import 'package:remind_me/models/zip_codes_model.dart';
part 'locality_model.g.dart';
@JsonSerializable()
class LocalityModel{
  final String? stateName;
  final String? country;
  final List<ZipCodesModel> details;
  factory LocalityModel.fromJson(Map<String, dynamic> json)=>_$LocalityModelFromJson(json);

  LocalityModel({required this.stateName, required this.country, required this.details});
  Map<String, dynamic> toJson()=>_$LocalityModelToJson(this);
}