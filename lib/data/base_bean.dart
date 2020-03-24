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

@JsonSerializable()
class PageBean {
  final int offset;
  final bool orver;
  final int pageCount;
  final int size;
  final int total;
  final int curPage;
  final List<dynamic> datas;

  PageBean(this.offset, this.orver, this.pageCount, this.size, this.total,
      this.curPage, this.datas);

  factory PageBean.fromJson(Map<String, dynamic> json) =>
      _$PageBeanFromJson(json);

  Map<String, dynamic> toJson() => _$PageBeanToJson(this);
}
