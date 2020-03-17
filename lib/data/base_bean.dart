import 'package:json_annotation/json_annotation.dart';

part 'base_bean.g.dart';

@JsonSerializable()
class BaseBean {
  @JsonKey(name: "errorCode")
  final int errorCode;

  @JsonKey(name: "errorMsg")
  final String errorMsg;

  @JsonKey(name: "data")
  final dynamic data;

  BaseBean(this.errorCode, this.errorMsg, this.data);

  bool get isSuccess => errorCode == 0;

  factory BaseBean.fromJson(Map<String, dynamic> json) =>
      _$BaseBeanFromJson(json);

  toJson(Map<String, dynamic> map) => _$BaseBeanToJson(this);
}
