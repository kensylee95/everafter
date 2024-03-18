import 'package:json_annotation/json_annotation.dart';
part 'filter_life_styles.g.dart';
@JsonSerializable(explicitToJson: true)
class FilterLifeStyles{
  final List<String>? doYouDrink;
  final List<String>? doYouSmoke;
  final List<String>? maritalStatus;
  final List<String>? havePets;
  final List<String>? occupation;
  final List<String>? employmentStatus;
  final List<String>? livingSituation;
  final List<String>? lookingFor;
  


  FilterLifeStyles({this.doYouDrink, this.doYouSmoke, this.maritalStatus,  this.havePets, this.occupation, this.employmentStatus, this.livingSituation, this.lookingFor});
  factory FilterLifeStyles.fromJson(Map<String, dynamic>json)=>_$FilterLifeStylesFromJson(json);
  Map<String, dynamic>toJson()=>_$FilterLifeStylesToJson(this);
}