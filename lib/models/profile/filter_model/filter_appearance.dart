import 'package:json_annotation/json_annotation.dart';
part 'filter_appearance.g.dart';
@JsonSerializable(explicitToJson: true)
class FilterAppearance{
  final List<String>? hairColor;
  final List<String>? eyeColor;
  final List<String>? height;
  final List<String>? weight;
  final List<String>? bodyType;
  final List<String>? ethnicity;
  final List<String>? bodyArt;
  


  FilterAppearance({this.hairColor, this.eyeColor, this.height, this.weight, this.bodyType, this.ethnicity, this.bodyArt, });
  factory FilterAppearance.fromJson(Map<String, dynamic>json)=>_$FilterAppearanceFromJson(json);
  Map<String, dynamic>toJson()=>_$FilterAppearanceToJson(this);
}