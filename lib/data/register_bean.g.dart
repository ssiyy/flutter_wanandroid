// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Register _$RegisterFromJson(Map<String, dynamic> json) {
  return Register(
    json['admin'] as bool,
    json['chapterTops'] as List,
    json['collectIds'] as List,
    json['email'] as String,
    json['icon'] as String,
    json['id'] as int,
    json['nickname'] as String,
    json['password'] as String,
    json['publicName'] as String,
    json['token'] as String,
    json['type'] as int,
    json['username'] as String,
  );
}

Map<String, dynamic> _$RegisterToJson(Register instance) => <String, dynamic>{
      'admin': instance.admin,
      'chapterTops': instance.chapterTops,
      'collectIds': instance.collectIds,
      'email': instance.email,
      'icon': instance.icon,
      'id': instance.id,
      'nickname': instance.nickname,
      'password': instance.password,
      'publicName': instance.publicName,
      'token': instance.token,
      'type': instance.type,
      'username': instance.username,
    };
