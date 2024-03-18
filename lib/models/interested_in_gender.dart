import 'package:json_annotation/json_annotation.dart';
part 'interested_in_gender.g.dart';
@JsonSerializable()
class InterestedInGender {
  final int id;
  final int userId;
  final int genderId;

  InterestedInGender({
    required this.id, 
    required this.userId,
    required this.genderId,
  });
  factory InterestedInGender.fromJson(Map<String, dynamic> json)=>_$InterestedInGenderFromJson(json);
  Map<String, dynamic> toJson()=>_$InterestedInGenderToJson(this);
}
