// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeListPage _$HomeListPageFromJson(Map<String, dynamic> json) {
  return HomeListPage(
    json['offset'] as int,
    json['orver'] as bool,
    json['pageCount'] as int,
    json['size'] as int,
    json['total'] as int,
    json['curPage'] as int,
    (json['datas'] as List)
        ?.map((e) =>
            e == null ? null : HomeList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$HomeListPageToJson(HomeListPage instance) =>
    <String, dynamic>{
      'offset': instance.offset,
      'orver': instance.orver,
      'pageCount': instance.pageCount,
      'size': instance.size,
      'total': instance.total,
      'curPage': instance.curPage,
      'datas': instance.datas,
    };

HomeList _$HomeListFromJson(Map<String, dynamic> json) {
  return HomeList()
    ..apkLink = json['apkLink'] as String
    ..audit = json['audit'] as int
    ..author = json['author'] as String
    ..canEdit = json['canEdit'] as bool
    ..chapterId = json['chapterId'] as int
    ..chapterName = json['chapterName'] as String
    ..collect = json['collect'] as bool
    ..courseId = json['courseId'] as int
    ..desc = json['desc'] as String
    ..descMd = json['descMd'] as String
    ..envelopePic = json['envelopePic'] as String
    ..fresh = json['fresh'] as bool
    ..id = json['id'] as int
    ..link = json['link'] as String
    ..niceDate = json['niceDate'] as String
    ..niceShareDate = json['niceShareDate'] as String
    ..origin = json['origin'] as String
    ..prefix = json['prefix'] as String
    ..projectLink = json['projectLink'] as String
    ..publishTime = json['publishTime'] as int
    ..selfVisible = json['selfVisible'] as int
    ..shareDate = json['shareDate'] as int
    ..shareUser = json['shareUser'] as String
    ..superChapterId = json['superChapterId'] as int
    ..superChapterName = json['superChapterName'] as String
    ..tags = (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..title = json['title'] as String
    ..type = json['type'] as int
    ..userId = json['userId'] as int
    ..visible = json['visible'] as int
    ..zan = json['zan'] as int;
}

Map<String, dynamic> _$HomeListToJson(HomeList instance) => <String, dynamic>{
      'apkLink': instance.apkLink,
      'audit': instance.audit,
      'author': instance.author,
      'canEdit': instance.canEdit,
      'chapterId': instance.chapterId,
      'chapterName': instance.chapterName,
      'collect': instance.collect,
      'courseId': instance.courseId,
      'desc': instance.desc,
      'descMd': instance.descMd,
      'envelopePic': instance.envelopePic,
      'fresh': instance.fresh,
      'id': instance.id,
      'link': instance.link,
      'niceDate': instance.niceDate,
      'niceShareDate': instance.niceShareDate,
      'origin': instance.origin,
      'prefix': instance.prefix,
      'projectLink': instance.projectLink,
      'publishTime': instance.publishTime,
      'selfVisible': instance.selfVisible,
      'shareDate': instance.shareDate,
      'shareUser': instance.shareUser,
      'superChapterId': instance.superChapterId,
      'superChapterName': instance.superChapterName,
      'tags': instance.tags,
      'title': instance.title,
      'type': instance.type,
      'userId': instance.userId,
      'visible': instance.visible,
      'zan': instance.zan,
    };

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag()
    ..name = json['name'] as String
    ..url = json['url'] as String;
}

Map<String, dynamic> _$TagToJson(Tag instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

HomeBanner _$HomeBannerFromJson(Map<String, dynamic> json) {
  return HomeBanner()
    ..desc = json['desc'] as String
    ..id = json['id'] as int
    ..imagePath = json['imagePath'] as String
    ..isVisible = json['isVisible'] as int
    ..order = json['order'] as int
    ..title = json['title'] as String
    ..type = json['type'] as int
    ..url = json['url'] as String;
}

Map<String, dynamic> _$HomeBannerToJson(HomeBanner instance) =>
    <String, dynamic>{
      'desc': instance.desc,
      'id': instance.id,
      'imagePath': instance.imagePath,
      'isVisible': instance.isVisible,
      'order': instance.order,
      'title': instance.title,
      'type': instance.type,
      'url': instance.url,
    };
