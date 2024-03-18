import 'package:json_annotation/json_annotation.dart';
import 'package:remind_me/models/profile/appearance.dart';
import 'package:remind_me/models/profile/cultural_values.dart';
import 'package:remind_me/models/profile/lifestyle.dart';
part 'user_props.g.dart';
@JsonSerializable(explicitToJson: true)
class UserProps{
  Appearance? appearance;
  LifeStyle? lifeStyle;
  CulturalValues? culturalValues;

  UserProps({this.appearance,this.culturalValues, this.lifeStyle});
  factory UserProps.fromJson(Map<String, dynamic>json)=>_$UserPropsFromJson(json);
  Map<String, dynamic>toJson()=>_$UserPropsToJson(this);
}