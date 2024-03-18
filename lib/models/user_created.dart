import 'package:json_annotation/json_annotation.dart';

part 'user_created.g.dart';

@JsonSerializable()
class UserCreated {
  final int id;
  final bool created;
  final String username;
  final String email;

  UserCreated({
    required this.id,
    required this.created,
    required this.username,
    required this.email,
  });
  factory UserCreated.fromJson(Map<String, dynamic> json) =>
      _$UserCreatedFromJson(json);

  Map<String, dynamic> toJson() => _$UserCreatedToJson(this);
}
