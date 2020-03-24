// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseBean _$BaseBeanFromJson(Map<String, dynamic> json) {
  return BaseBean(
    json['errorCode'] as int,
    json['errorMsg'] as String,
    json['data'],
  );
}

Map<String, dynamic> _$BaseBeanToJson(BaseBean instance) => <String, dynamic>{
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
      'data': instance.data,
    };

PageBean _$PageBeanFromJson(Map<String, dynamic> json) {
  return PageBean(
    json['offset'] as int,
    json['orver'] as bool,
    json['pageCount'] as int,
    json['size'] as int,
    json['total'] as int,
    json['curPage'] as int,
    json['datas'] as List,
  );
}

Map<String, dynamic> _$PageBeanToJson(PageBean instance) => <String, dynamic>{
      'offset': instance.offset,
      'orver': instance.orver,
      'pageCount': instance.pageCount,
      'size': instance.size,
      'total': instance.total,
      'curPage': instance.curPage,
      'datas': instance.datas,
    };
