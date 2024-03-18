import 'package:json_annotation/json_annotation.dart';
part 'appearance.g.dart';
@JsonSerializable(explicitToJson: true)
class Appearance{
   String? hairColor;
   String? eyeColor;
   String? height;
   String? weight;
   String? bodyType;
   String? ethnicity;
   String? bodyArt;
  


  Appearance({this.hairColor, this.eyeColor, this.height, this.weight, this.bodyType, this.ethnicity, this.bodyArt, });
  factory Appearance.fromJson(Map<String, dynamic>json)=>_$AppearanceFromJson(json);
  Map<String, dynamic>toJson()=>_$AppearanceToJson(this);
}