import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wanandroid/data/base_bean.dart';
import 'package:wanandroid/db/bean/home_bean_db.dart';

part 'home_bean.g.dart';

///首页列表
@JsonSerializable()
class HomeListPage extends PageBean {
  List<HomeList> datas;

  HomeListPage(int offset, bool orver, int pageCount, int size, int total,
      int curPage, this.datas)
      : super(offset, orver, pageCount, size, total, curPage, datas);

  factory HomeListPage.fromJson(Map<String, dynamic> json) =>
      _$HomeListPageFromJson(json);

  Map<String, dynamic> toJson() => _$HomeListPageToJson(this);
}

///首页列表
@JsonSerializable()
class HomeList {
  String apkLink;
  int audit;
  String author;
  bool canEdit;
  int chapterId;
  String chapterName;
  bool collect;
  int courseId;
  String desc;
  String descMd;
  String envelopePic;
  bool fresh;
  @PrimaryKey(isNullable: false)
  int id;
  String link;
  String niceDate;
  String niceShareDate;
  String origin;
  String prefix;
  String projectLink;
  int publishTime;
  int selfVisible;
  int shareDate;
  String shareUser;
  int superChapterId;
  String superChapterName;
  @HasMany(TagBean)
  List<Tag> tags;
  String title;
  int type;
  int userId;
  int visible;
  int zan;

  HomeList();

  HomeList.make(
      this.apkLink,
      this.audit,
      this.author,
      this.canEdit,
      this.chapterId,
      this.chapterName,
      this.collect,
      this.courseId,
      this.desc,
      this.descMd,
      this.envelopePic,
      this.fresh,
      this.id,
      this.link,
      this.niceDate,
      this.niceShareDate,
      this.origin,
      this.prefix,
      this.projectLink,
      this.publishTime,
      this.selfVisible,
      this.shareDate,
      this.shareUser,
      this.superChapterId,
      this.superChapterName,
      this.tags,
      this.title,
      this.type,
      this.userId,
      this.visible,
      this.zan);

  factory HomeList.fromJson(Map<String, dynamic> json) =>
      _$HomeListFromJson(json);

  Map<String, dynamic> toJson() => _$HomeListToJson(this);
}

///首页列表的tag
@JsonSerializable()
class Tag {
  String name;
  String url;

  ///提供给数据库用的
  @JsonKey(ignore: true)
  @PrimaryKey(auto: true)
  int id;

  ///提供给数据库用的，对应于[HomeList]的id
  @JsonKey(ignore: true)
  @BelongsTo(HomeListBean)
  int homeId;

  Tag();

  Tag.make(this.name, this.url);

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

///首页的轮播图
@JsonSerializable()
class HomeBanner {
  String desc;
  int id;
  String imagePath;
  int isVisible;
  int order;
  String title;
  int type;
  String url;

  HomeBanner(this.desc, this.id, this.imagePath, this.isVisible, this.order,
      this.title, this.type, this.url);

  factory HomeBanner.fromJson(Map<String, dynamic> json) =>
      _$HomeBannerFromJson(json);

  Map<String, dynamic> toJson() => _$HomeBannerToJson(this);
}
