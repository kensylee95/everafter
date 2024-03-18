import 'package:json_annotation/json_annotation.dart';
import 'package:remind_me/models/profile/filter_model/filter_life_styles.dart';
import 'package:remind_me/models/profile/filter_model/filter_appearance.dart';
import 'package:remind_me/models/profile/filter_model/filter_cultural_values.dart';
part 'filter_model.g.dart';
@JsonSerializable(explicitToJson: true)
class FilterModel{
  final FilterAppearance? filterAppearance;
  final FilterLifeStyles? filterLifeStyles;
  final FilterCulturalValues? filterCulturalValues;
  int? filterNumberOfPhotos;

  FilterModel({this.filterAppearance, this.filterNumberOfPhotos, this.filterLifeStyles, this.filterCulturalValues});
  factory FilterModel.fromJson(Map<String, dynamic>json)=>_$FilterModelFromJson(json);
  Map<String, dynamic>toJson()=>_$FilterModelToJson(this);
}