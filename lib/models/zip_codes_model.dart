import 'package:json_annotation/json_annotation.dart';
part 'zip_codes_model.g.dart';
@JsonSerializable()
class ZipCodesModel{
  final String name;
  final String zipCode;
  factory ZipCodesModel.fromJson(Map<String, dynamic> json)=>_$ZipCodesModelFromJson(json);

  ZipCodesModel({required this.name, required this.zipCode,});
  Map<String, dynamic> toJson()=>_$ZipCodesModelToJson(this);
}