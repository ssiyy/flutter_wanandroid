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
