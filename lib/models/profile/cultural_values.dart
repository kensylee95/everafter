import 'package:json_annotation/json_annotation.dart';
part 'cultural_values.g.dart';
@JsonSerializable(explicitToJson: true)
class CulturalValues{
   String? education;
   String? height;
   String? religion;
   String? starSign;

  CulturalValues({this.education, this.height, this.religion, this.starSign,});
  factory CulturalValues.fromJson(Map<String, dynamic>json)=>_$CulturalValuesFromJson(json);
  Map<String, dynamic>toJson()=>_$CulturalValuesToJson(this);
}