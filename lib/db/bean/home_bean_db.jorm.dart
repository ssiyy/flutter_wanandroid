// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_bean_db.dart';

// **************************************************************************
// BeanGenerator
// **************************************************************************

abstract class _HomeListBean implements Bean<HomeList> {
  final apkLink = StrField('apk_link');
  final audit = IntField('audit');
  final author = StrField('author');
  final canEdit = BoolField('can_edit');
  final chapterId = IntField('chapter_id');
  final chapterName = StrField('chapter_name');
  final collect = BoolField('collect');
  final courseId = IntField('course_id');
  final desc = StrField('desc');
  final descMd = StrField('desc_md');
  final envelopePic = StrField('envelope_pic');
  final fresh = BoolField('fresh');
  final id = IntField('id');
  final link = StrField('link');
  final niceDate = StrField('nice_date');
  final niceShareDate = StrField('nice_share_date');
  final origin = StrField('origin');
  final prefix = StrField('prefix');
  final projectLink = StrField('project_link');
  final publishTime = IntField('publish_time');
  final selfVisible = IntField('self_visible');
  final shareDate = IntField('share_date');
  final shareUser = StrField('share_user');
  final superChapterId = IntField('super_chapter_id');
  final superChapterName = StrField('super_chapter_name');
  final title = StrField('title');
  final type = IntField('type');
  final userId = IntField('user_id');
  final visible = IntField('visible');
  final zan = IntField('zan');
  Map<String, Field> _fields;
  Map<String, Field> get fields => _fields ??= {
        apkLink.name: apkLink,
        audit.name: audit,
        author.name: author,
        canEdit.name: canEdit,
        chapterId.name: chapterId,
        chapterName.name: chapterName,
        collect.name: collect,
        courseId.name: courseId,
        desc.name: desc,
        descMd.name: descMd,
        envelopePic.name: envelopePic,
        fresh.name: fresh,
        id.name: id,
        link.name: link,
        niceDate.name: niceDate,
        niceShareDate.name: niceShareDate,
        origin.name: origin,
        prefix.name: prefix,
        projectLink.name: projectLink,
        publishTime.name: publishTime,
        selfVisible.name: selfVisible,
        shareDate.name: shareDate,
        shareUser.name: shareUser,
        superChapterId.name: superChapterId,
        superChapterName.name: superChapterName,
        title.name: title,
        type.name: type,
        userId.name: userId,
        visible.name: visible,
        zan.name: zan,
      };
  HomeList fromMap(Map map) {
    HomeList model = HomeList();
    model.apkLink = adapter.parseValue(map['apk_link']);
    model.audit = adapter.parseValue(map['audit']);
    model.author = adapter.parseValue(map['author']);
    model.canEdit = adapter.parseValue(map['can_edit']);
    model.chapterId = adapter.parseValue(map['chapter_id']);
    model.chapterName = adapter.parseValue(map['chapter_name']);
    model.collect = adapter.parseValue(map['collect']);
    model.courseId = adapter.parseValue(map['course_id']);
    model.desc = adapter.parseValue(map['desc']);
    model.descMd = adapter.parseValue(map['desc_md']);
    model.envelopePic = adapter.parseValue(map['envelope_pic']);
    model.fresh = adapter.parseValue(map['fresh']);
    model.id = adapter.parseValue(map['id']);
    model.link = adapter.parseValue(map['link']);
    model.niceDate = adapter.parseValue(map['nice_date']);
    model.niceShareDate = adapter.parseValue(map['nice_share_date']);
    model.origin = adapter.parseValue(map['origin']);
    model.prefix = adapter.parseValue(map['prefix']);
    model.projectLink = adapter.parseValue(map['project_link']);
    model.publishTime = adapter.parseValue(map['publish_time']);
    model.selfVisible = adapter.parseValue(map['self_visible']);
    model.shareDate = adapter.parseValue(map['share_date']);
    model.shareUser = adapter.parseValue(map['share_user']);
    model.superChapterId = adapter.parseValue(map['super_chapter_id']);
    model.superChapterName = adapter.parseValue(map['super_chapter_name']);
    model.title = adapter.parseValue(map['title']);
    model.type = adapter.parseValue(map['type']);
    model.userId = adapter.parseValue(map['user_id']);
    model.visible = adapter.parseValue(map['visible']);
    model.zan = adapter.parseValue(map['zan']);

    return model;
  }

  List<SetColumn> toSetColumns(HomeList model,
      {bool update = false, Set<String> only, bool onlyNonNull = false}) {
    List<SetColumn> ret = [];

    if (only == null && !onlyNonNull) {
      ret.add(apkLink.set(model.apkLink));
      ret.add(audit.set(model.audit));
      ret.add(author.set(model.author));
      ret.add(canEdit.set(model.canEdit));
      ret.add(chapterId.set(model.chapterId));
      ret.add(chapterName.set(model.chapterName));
      ret.add(collect.set(model.collect));
      ret.add(courseId.set(model.courseId));
      ret.add(desc.set(model.desc));
      ret.add(descMd.set(model.descMd));
      ret.add(envelopePic.set(model.envelopePic));
      ret.add(fresh.set(model.fresh));
      ret.add(id.set(model.id));
      ret.add(link.set(model.link));
      ret.add(niceDate.set(model.niceDate));
      ret.add(niceShareDate.set(model.niceShareDate));
      ret.add(origin.set(model.origin));
      ret.add(prefix.set(model.prefix));
      ret.add(projectLink.set(model.projectLink));
      ret.add(publishTime.set(model.publishTime));
      ret.add(selfVisible.set(model.selfVisible));
      ret.add(shareDate.set(model.shareDate));
      ret.add(shareUser.set(model.shareUser));
      ret.add(superChapterId.set(model.superChapterId));
      ret.add(superChapterName.set(model.superChapterName));
      ret.add(title.set(model.title));
      ret.add(type.set(model.type));
      ret.add(userId.set(model.userId));
      ret.add(visible.set(model.visible));
      ret.add(zan.set(model.zan));
    } else if (only != null) {
      if (only.contains(apkLink.name)) ret.add(apkLink.set(model.apkLink));
      if (only.contains(audit.name)) ret.add(audit.set(model.audit));
      if (only.contains(author.name)) ret.add(author.set(model.author));
      if (only.contains(canEdit.name)) ret.add(canEdit.set(model.canEdit));
      if (only.contains(chapterId.name))
        ret.add(chapterId.set(model.chapterId));
      if (only.contains(chapterName.name))
        ret.add(chapterName.set(model.chapterName));
      if (only.contains(collect.name)) ret.add(collect.set(model.collect));
      if (only.contains(courseId.name)) ret.add(courseId.set(model.courseId));
      if (only.contains(desc.name)) ret.add(desc.set(model.desc));
      if (only.contains(descMd.name)) ret.add(descMd.set(model.descMd));
      if (only.contains(envelopePic.name))
        ret.add(envelopePic.set(model.envelopePic));
      if (only.contains(fresh.name)) ret.add(fresh.set(model.fresh));
      if (only.contains(id.name)) ret.add(id.set(model.id));
      if (only.contains(link.name)) ret.add(link.set(model.link));
      if (only.contains(niceDate.name)) ret.add(niceDate.set(model.niceDate));
      if (only.contains(niceShareDate.name))
        ret.add(niceShareDate.set(model.niceShareDate));
      if (only.contains(origin.name)) ret.add(origin.set(model.origin));
      if (only.contains(prefix.name)) ret.add(prefix.set(model.prefix));
      if (only.contains(projectLink.name))
        ret.add(projectLink.set(model.projectLink));
      if (only.contains(publishTime.name))
        ret.add(publishTime.set(model.publishTime));
      if (only.contains(selfVisible.name))
        ret.add(selfVisible.set(model.selfVisible));
      if (only.contains(shareDate.name))
        ret.add(shareDate.set(model.shareDate));
      if (only.contains(shareUser.name))
        ret.add(shareUser.set(model.shareUser));
      if (only.contains(superChapterId.name))
        ret.add(superChapterId.set(model.superChapterId));
      if (only.contains(superChapterName.name))
        ret.add(superChapterName.set(model.superChapterName));
      if (only.contains(title.name)) ret.add(title.set(model.title));
      if (only.contains(type.name)) ret.add(type.set(model.type));
      if (only.contains(userId.name)) ret.add(userId.set(model.userId));
      if (only.contains(visible.name)) ret.add(visible.set(model.visible));
      if (only.contains(zan.name)) ret.add(zan.set(model.zan));
    } else /* if (onlyNonNull) */ {
      if (model.apkLink != null) {
        ret.add(apkLink.set(model.apkLink));
      }
      if (model.audit != null) {
        ret.add(audit.set(model.audit));
      }
      if (model.author != null) {
        ret.add(author.set(model.author));
      }
      if (model.canEdit != null) {
        ret.add(canEdit.set(model.canEdit));
      }
      if (model.chapterId != null) {
        ret.add(chapterId.set(model.chapterId));
      }
      if (model.chapterName != null) {
        ret.add(chapterName.set(model.chapterName));
      }
      if (model.collect != null) {
        ret.add(collect.set(model.collect));
      }
      if (model.courseId != null) {
        ret.add(courseId.set(model.courseId));
      }
      if (model.desc != null) {
        ret.add(desc.set(model.desc));
      }
      if (model.descMd != null) {
        ret.add(descMd.set(model.descMd));
      }
      if (model.envelopePic != null) {
        ret.add(envelopePic.set(model.envelopePic));
      }
      if (model.fresh != null) {
        ret.add(fresh.set(model.fresh));
      }
      if (model.id != null) {
        ret.add(id.set(model.id));
      }
      if (model.link != null) {
        ret.add(link.set(model.link));
      }
      if (model.niceDate != null) {
        ret.add(niceDate.set(model.niceDate));
      }
      if (model.niceShareDate != null) {
        ret.add(niceShareDate.set(model.niceShareDate));
      }
      if (model.origin != null) {
        ret.add(origin.set(model.origin));
      }
      if (model.prefix != null) {
        ret.add(prefix.set(model.prefix));
      }
      if (model.projectLink != null) {
        ret.add(projectLink.set(model.projectLink));
      }
      if (model.publishTime != null) {
        ret.add(publishTime.set(model.publishTime));
      }
      if (model.selfVisible != null) {
        ret.add(selfVisible.set(model.selfVisible));
      }
      if (model.shareDate != null) {
        ret.add(shareDate.set(model.shareDate));
      }
      if (model.shareUser != null) {
        ret.add(shareUser.set(model.shareUser));
      }
      if (model.superChapterId != null) {
        ret.add(superChapterId.set(model.superChapterId));
      }
      if (model.superChapterName != null) {
        ret.add(superChapterName.set(model.superChapterName));
      }
      if (model.title != null) {
        ret.add(title.set(model.title));
      }
      if (model.type != null) {
        ret.add(type.set(model.type));
      }
      if (model.userId != null) {
        ret.add(userId.set(model.userId));
      }
      if (model.visible != null) {
        ret.add(visible.set(model.visible));
      }
      if (model.zan != null) {
        ret.add(zan.set(model.zan));
      }
    }

    return ret;
  }

  Future<void> createTable({bool ifNotExists = false}) async {
    final st = Sql.create(tableName, ifNotExists: ifNotExists);
    st.addStr(apkLink.name, isNullable: false);
    st.addInt(audit.name, isNullable: false);
    st.addStr(author.name, isNullable: false);
    st.addBool(canEdit.name, isNullable: false);
    st.addInt(chapterId.name, isNullable: false);
    st.addStr(chapterName.name, isNullable: false);
    st.addBool(collect.name, isNullable: false);
    st.addInt(courseId.name, isNullable: false);
    st.addStr(desc.name, isNullable: false);
    st.addStr(descMd.name, isNullable: false);
    st.addStr(envelopePic.name, isNullable: false);
    st.addBool(fresh.name, isNullable: false);
    st.addInt(id.name, primary: true, isNullable: false);
    st.addStr(link.name, isNullable: false);
    st.addStr(niceDate.name, isNullable: false);
    st.addStr(niceShareDate.name, isNullable: false);
    st.addStr(origin.name, isNullable: false);
    st.addStr(prefix.name, isNullable: false);
    st.addStr(projectLink.name, isNullable: false);
    st.addInt(publishTime.name, isNullable: false);
    st.addInt(selfVisible.name, isNullable: false);
    st.addInt(shareDate.name, isNullable: false);
    st.addStr(shareUser.name, isNullable: false);
    st.addInt(superChapterId.name, isNullable: false);
    st.addStr(superChapterName.name, isNullable: false);
    st.addStr(title.name, isNullable: false);
    st.addInt(type.name, isNullable: false);
    st.addInt(userId.name, isNullable: false);
    st.addInt(visible.name, isNullable: false);
    st.addInt(zan.name, isNullable: false);
    return adapter.createTable(st);
  }

  Future<dynamic> insert(HomeList model,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    final Insert insert = inserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    var retId = await adapter.insert(insert);
    if (cascade) {
      HomeList newModel;
      if (model.tags != null) {
        newModel ??= await find(model.id);
        model.tags.forEach((x) => tagBean.associateHomeList(x, newModel));
        for (final child in model.tags) {
          await tagBean.insert(child, cascade: cascade);
        }
      }
    }
    return retId;
  }

  Future<void> insertMany(List<HomeList> models,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    if (cascade) {
      final List<Future> futures = [];
      for (var model in models) {
        futures.add(insert(model, cascade: cascade));
      }
      await Future.wait(futures);
      return;
    } else {
      final List<List<SetColumn>> data = models
          .map((model) =>
              toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
          .toList();
      final InsertMany insert = inserters.addAll(data);
      await adapter.insertMany(insert);
      return;
    }
  }

  Future<dynamic> upsert(HomeList model,
      {bool cascade = false,
      Set<String> only,
      bool onlyNonNull = false,
      isForeignKeyEnabled = false}) async {
    var retId;
    if (isForeignKeyEnabled) {
      final Insert insert = Insert(tableName, ignoreIfExist: true)
          .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
      retId = await adapter.insert(insert);
      if (retId == null) {
        final Update update = updater
            .where(this.id.eq(model.id))
            .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
        retId = adapter.update(update);
      }
    } else {
      final Upsert upsert = upserter
          .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
      retId = await adapter.upsert(upsert);
    }
    if (cascade) {
      HomeList newModel;
      if (model.tags != null) {
        newModel ??= await find(model.id);
        model.tags.forEach((x) => tagBean.associateHomeList(x, newModel));
        for (final child in model.tags) {
          await tagBean.upsert(child, cascade: cascade);
        }
      }
    }
    return retId;
  }

  Future<void> upsertMany(List<HomeList> models,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only,
      isForeignKeyEnabled = false}) async {
    if (cascade || isForeignKeyEnabled) {
      final List<Future> futures = [];
      for (var model in models) {
        futures.add(upsert(model,
            cascade: cascade, isForeignKeyEnabled: isForeignKeyEnabled));
      }
      await Future.wait(futures);
      return;
    } else {
      final List<List<SetColumn>> data = [];
      for (var i = 0; i < models.length; ++i) {
        var model = models[i];
        data.add(
            toSetColumns(model, only: only, onlyNonNull: onlyNonNull).toList());
      }
      final UpsertMany upsert = upserters.addAll(data);
      await adapter.upsertMany(upsert);
      return;
    }
  }

  Future<int> update(HomeList model,
      {bool cascade = false,
      bool associate = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Update update = updater
        .where(this.id.eq(model.id))
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    final ret = adapter.update(update);
    if (cascade) {
      HomeList newModel;
      if (model.tags != null) {
        if (associate) {
          newModel ??= await find(model.id);
          model.tags.forEach((x) => tagBean.associateHomeList(x, newModel));
        }
        for (final child in model.tags) {
          await tagBean.update(child, cascade: cascade, associate: associate);
        }
      }
    }
    return ret;
  }

  Future<void> updateMany(List<HomeList> models,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    if (cascade) {
      final List<Future> futures = [];
      for (var model in models) {
        futures.add(update(model, cascade: cascade));
      }
      await Future.wait(futures);
      return;
    } else {
      final List<List<SetColumn>> data = [];
      final List<Expression> where = [];
      for (var i = 0; i < models.length; ++i) {
        var model = models[i];
        data.add(
            toSetColumns(model, only: only, onlyNonNull: onlyNonNull).toList());
        where.add(this.id.eq(model.id));
      }
      final UpdateMany update = updaters.addAll(data, where);
      await adapter.updateMany(update);
      return;
    }
  }

  Future<HomeList> find(int id,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.id.eq(id));
    final HomeList model = await findOne(find);
    if (preload && model != null) {
      await this.preload(model, cascade: cascade);
    }
    return model;
  }

  Future<int> remove(int id, {bool cascade = false}) async {
    if (cascade) {
      final HomeList newModel = await find(id);
      if (newModel != null) {
        await tagBean.removeByHomeList(newModel.id);
      }
    }
    final Remove remove = remover.where(this.id.eq(id));
    return adapter.remove(remove);
  }

  Future<int> removeMany(List<HomeList> models) async {
// Return if models is empty. If this is not done, all records will be removed!
    if (models == null || models.isEmpty) return 0;
    final Remove remove = remover;
    for (final model in models) {
      remove.or(this.id.eq(model.id));
    }
    return adapter.remove(remove);
  }

  Future<HomeList> preload(HomeList model, {bool cascade = false}) async {
    model.tags = await tagBean.findByHomeList(model.id,
        preload: cascade, cascade: cascade);
    return model;
  }

  Future<List<HomeList>> preloadAll(List<HomeList> models,
      {bool cascade = false}) async {
    models.forEach((HomeList model) => model.tags ??= []);
    await OneToXHelper.preloadAll<HomeList, Tag>(
        models,
        (HomeList model) => [model.id],
        tagBean.findByHomeListList,
        (Tag model) => [model.homeId],
        (HomeList model, Tag child) =>
            model.tags = List.from(model.tags)..add(child),
        cascade: cascade);
    return models;
  }

  TagBean get tagBean;
}

abstract class _TagBean implements Bean<Tag> {
  final name = StrField('name');
  final url = StrField('url');
  final id = IntField('id');
  final homeId = IntField('home_id');
  Map<String, Field> _fields;
  Map<String, Field> get fields => _fields ??= {
        name.name: name,
        url.name: url,
        id.name: id,
        homeId.name: homeId,
      };
  Tag fromMap(Map map) {
    Tag model = Tag();
    model.name = adapter.parseValue(map['name']);
    model.url = adapter.parseValue(map['url']);
    model.id = adapter.parseValue(map['id']);
    model.homeId = adapter.parseValue(map['home_id']);

    return model;
  }

  List<SetColumn> toSetColumns(Tag model,
      {bool update = false, Set<String> only, bool onlyNonNull = false}) {
    List<SetColumn> ret = [];

    if (only == null && !onlyNonNull) {
      ret.add(name.set(model.name));
      ret.add(url.set(model.url));
      if (model.id != null) {
        ret.add(id.set(model.id));
      }
      ret.add(homeId.set(model.homeId));
    } else if (only != null) {
      if (only.contains(name.name)) ret.add(name.set(model.name));
      if (only.contains(url.name)) ret.add(url.set(model.url));
      if (model.id != null) {
        if (only.contains(id.name)) ret.add(id.set(model.id));
      }
      if (only.contains(homeId.name)) ret.add(homeId.set(model.homeId));
    } else /* if (onlyNonNull) */ {
      if (model.name != null) {
        ret.add(name.set(model.name));
      }
      if (model.url != null) {
        ret.add(url.set(model.url));
      }
      if (model.id != null) {
        ret.add(id.set(model.id));
      }
      if (model.homeId != null) {
        ret.add(homeId.set(model.homeId));
      }
    }

    return ret;
  }

  Future<void> createTable({bool ifNotExists = false}) async {
    final st = Sql.create(tableName, ifNotExists: ifNotExists);
    st.addStr(name.name, isNullable: false);
    st.addStr(url.name, isNullable: false);
    st.addInt(id.name, primary: true, autoIncrement: true, isNullable: false);
    st.addInt(homeId.name,
        foreignTable: homeListBean.tableName,
        foreignCol: homeListBean.id.name,
        isNullable: false);
    return adapter.createTable(st);
  }

  Future<dynamic> insert(Tag model,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    final Insert insert = inserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
        .id(id.name);
    var retId = await adapter.insert(insert);
    if (cascade) {
      Tag newModel;
    }
    return retId;
  }

  Future<void> insertMany(List<Tag> models,
      {bool onlyNonNull = false, Set<String> only}) async {
    final List<List<SetColumn>> data = models
        .map((model) =>
            toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
        .toList();
    final InsertMany insert = inserters.addAll(data);
    await adapter.insertMany(insert);
    return;
  }

  Future<dynamic> upsert(Tag model,
      {bool cascade = false,
      Set<String> only,
      bool onlyNonNull = false,
      isForeignKeyEnabled = false}) async {
    var retId;
    if (isForeignKeyEnabled) {
      final Insert insert = Insert(tableName, ignoreIfExist: true)
          .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
      retId = await adapter.insert(insert);
      if (retId == null) {
        final Update update = updater
            .where(this.id.eq(model.id))
            .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
        retId = adapter.update(update);
      }
    } else {
      final Upsert upsert = upserter
          .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
          .id(id.name);
      retId = await adapter.upsert(upsert);
    }
    if (cascade) {
      Tag newModel;
    }
    return retId;
  }

  Future<void> upsertMany(List<Tag> models,
      {bool onlyNonNull = false,
      Set<String> only,
      isForeignKeyEnabled = false}) async {
    final List<List<SetColumn>> data = [];
    for (var i = 0; i < models.length; ++i) {
      var model = models[i];
      data.add(
          toSetColumns(model, only: only, onlyNonNull: onlyNonNull).toList());
    }
    final UpsertMany upsert = upserters.addAll(data);
    await adapter.upsertMany(upsert);
    return;
  }

  Future<int> update(Tag model,
      {bool cascade = false,
      bool associate = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Update update = updater
        .where(this.id.eq(model.id))
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.update(update);
  }

  Future<void> updateMany(List<Tag> models,
      {bool onlyNonNull = false, Set<String> only}) async {
    final List<List<SetColumn>> data = [];
    final List<Expression> where = [];
    for (var i = 0; i < models.length; ++i) {
      var model = models[i];
      data.add(
          toSetColumns(model, only: only, onlyNonNull: onlyNonNull).toList());
      where.add(this.id.eq(model.id));
    }
    final UpdateMany update = updaters.addAll(data, where);
    await adapter.updateMany(update);
    return;
  }

  Future<Tag> find(int id, {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.id.eq(id));
    return await findOne(find);
  }

  Future<int> remove(int id) async {
    final Remove remove = remover.where(this.id.eq(id));
    return adapter.remove(remove);
  }

  Future<int> removeMany(List<Tag> models) async {
// Return if models is empty. If this is not done, all records will be removed!
    if (models == null || models.isEmpty) return 0;
    final Remove remove = remover;
    for (final model in models) {
      remove.or(this.id.eq(model.id));
    }
    return adapter.remove(remove);
  }

  Future<List<Tag>> findByHomeList(int homeId,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.homeId.eq(homeId));
    return findMany(find);
  }

  Future<List<Tag>> findByHomeListList(List<HomeList> models,
      {bool preload = false, bool cascade = false}) async {
// Return if models is empty. If this is not done, all the records will be returned!
    if (models == null || models.isEmpty) return [];
    final Find find = finder;
    for (HomeList model in models) {
      find.or(this.homeId.eq(model.id));
    }
    return findMany(find);
  }

  Future<int> removeByHomeList(int homeId) async {
    final Remove rm = remover.where(this.homeId.eq(homeId));
    return await adapter.remove(rm);
  }

  void associateHomeList(Tag child, HomeList parent) {
    child.homeId = parent.id;
  }

  HomeListBean get homeListBean;
}
