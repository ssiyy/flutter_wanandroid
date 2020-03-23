import 'package:json_annotation/json_annotation.dart';

part 'register_bean.g.dart';

@JsonSerializable()
class Register {
  final bool admin;
  final List<dynamic> chapterTops;
  final List<dynamic> collectIds;
  final String email;
  final String icon;
  final int id;
  final String nickname;
  final String password;
  final String publicName;
  final String token;
  final int type;
  final String username;

  Register(
      this.admin,
      this.chapterTops,
      this.collectIds,
      this.email,
      this.icon,
      this.id,
      this.nickname,
      this.password,
      this.publicName,
      this.token,
      this.type,
      this.username);

  factory Register.fromJson(Map<String, dynamic> json) =>
      _$RegisterFromJson(json);

  toJson(Map<String, dynamic> map) => _$RegisterToJson(this);
}
