import 'package:json_annotation/json_annotation.dart';
part 'lifestyle.g.dart';
@JsonSerializable(explicitToJson: true)
class LifeStyle{
  String? doYouDrink;
   String? doYouSmoke;
   String? maritalStatus;
   String? havePets;
   String? occupation;
   String? employmentStatus;
   String? livingSituation;
   List<String>? lookingFor;
  


  LifeStyle({this.doYouDrink, this.doYouSmoke, this.maritalStatus,  this.havePets, this.occupation, this.employmentStatus, this.livingSituation, this.lookingFor});
  factory LifeStyle.fromJson(Map<String, dynamic>json)=>_$LifeStyleFromJson(json);
  Map<String, dynamic>toJson()=>_$LifeStyleToJson(this);
}