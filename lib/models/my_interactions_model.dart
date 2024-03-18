import 'package:json_annotation/json_annotation.dart';
part 'my_interactions_model.g.dart';
@JsonSerializable()
class MyInteractionsModel {
  List<String?> likedIds;
  List<String?> favoritedIds;
  List<String?> dislikedIds;
  List<String?> blockedIds;


  MyInteractionsModel({
    required this.likedIds,
    required this.favoritedIds,
    required this.dislikedIds,
    required this.blockedIds,
  });
  factory MyInteractionsModel.fromJson(Map<String, dynamic> json)=>_$MyInteractionsModelFromJson(json);
  Map<String, dynamic> toJson()=>_$MyInteractionsModelToJson(this);
}
