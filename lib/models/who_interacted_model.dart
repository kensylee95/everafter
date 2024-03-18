import 'package:json_annotation/json_annotation.dart';
part 'who_interacted_model.g.dart';
@JsonSerializable()
class WhoInteractedModel {
  List<String?> likedIds;
  List<String?> favoritedIds;
  List<String?> dislikedIds;
  List<String?> blockedIds;


  WhoInteractedModel({
    required this.likedIds,
    required this.favoritedIds,
    required this.dislikedIds,
    required this.blockedIds,
  });
  factory WhoInteractedModel.fromJson(Map<String, dynamic> json)=>_$WhoInteractedModelFromJson(json);
  Map<String, dynamic> toJson()=>_$WhoInteractedModelToJson(this);
}
