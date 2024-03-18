import 'package:json_annotation/json_annotation.dart';
part 'filter_cultural_values.g.dart';
@JsonSerializable(explicitToJson: true)
class FilterCulturalValues{
  final List<String>? education;
  final List<String>? height;
  final List<String>? religion;
  final List<String>? starSign;

  FilterCulturalValues({this.education, this.height, this.religion, this.starSign,});
  factory FilterCulturalValues.fromJson(Map<String, dynamic>json)=>_$FilterCulturalValuesFromJson(json);
  Map<String, dynamic>toJson()=>_$FilterCulturalValuesToJson(this);
}