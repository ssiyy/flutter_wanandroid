import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:wanandroid/data/base_bean.dart';
import 'package:wanandroid/http/http_status.dart';
import 'package:wanandroid/util/extension_func.dart';

/// 用这个请求返回的数据，不会保存在数据库
///
/// @param NeedResultType 业务需求的数据类型
/// @param NetResultType 网络请求返回的数据类型
/// @param fetchNet 访问网络的请求
/// @param net2NeedResultTypeConvert 将网络请求返回的数据转成业务需求的数据，这个有默认实现
/// @param isBusinessSuccess 业务请求成功的判断，这个有默认现实
///
/// Created by Siy on 2020-3-30 11:17:06
///
Stream<Resource<NeedResultType>> fetchNetResource<NeedResultType>(
    {@required Future<NeedResultType> fetchNet()}) async* {
  yield Resource.loading(null);
  try {
    final response = await fetchNet();
    yield Resource.success(response);
  } on BaseBean catch (e) {
    yield Resource.faile(null, e.errorMsg);
  } catch (e) {
    yield Resource.faile(null, e.toString());
  }
}

/// 用这个请求返回的数据，会保存在数据库
///
/// [DbResultType] 数据库存储的数据类型
///
/// [NetResultType] 网络请求返回的数据类型
///
/// [loadFromDb] 从数据库获取数据
///
/// [fetchNet]  访问网络的请求
///
/// [insertDb] 保存到数据库
///
/// [shouldFetch] 否是需要从网络获取数据
///
/// [net2DbResultConvert] 网络数据转换成数据库保存的数据类型
///
/// [isBusinessSuccess] 业务请求成功的判断，这个有默认现实
///
/// Created by Siy on 2020-3-30 11:17:06
///
Stream<Resource<DbResultType>> loadData<DbResultType>({
  @required Stream<DbResultType> loadFromDb(),
  @required Future<DbResultType> fetch(),
  @required Future<void> saveCallResult(DbResultType dbResultType),
  /*DbResultType processResponse(NetResultType netResultType),*/
  bool shouldFetch(DbResultType dbResultType),
  void onFetchFailed(dynamic netResultType),
  /* bool isBusinessSuccess(NetResultType netResultType)*/
}) async* {
  //初始化一下默认参数
  if (shouldFetch == null) {
    shouldFetch = (_) => true;
  }

  if (onFetchFailed == null) {
    onFetchFailed = (_) => null;
  }
  //默认参数初始化完成

  Stream<Resource<DbResultType>> doFetch() async* {
    final first = await loadFromDb().firstWithDefault();
    yield Resource.loading(first);
    try {
      final result = await fetch();
      await saveCallResult(result);
      yield* loadFromDb().map((value) {
        return Resource.success(value);
      });
    } on BaseBean catch (e) {
      if (onFetchFailed != null) {
        onFetchFailed(e);
      }
      yield* loadFromDb().map((value) {
        return Resource.faile(value, e.errorMsg);
      });
    } catch (e) {
      if (onFetchFailed != null) {
        onFetchFailed(e);
      }
      yield* loadFromDb().map((value) {
        return Resource.faile(value, e.toString());
      });
    }
  }

  yield Resource.loading(null);
  final initialValue = await loadFromDb().firstWithDefault();
  if (!shouldFetch(initialValue)) {
    yield* loadFromDb().map((value) {
      return Resource.success(value);
    });
  } else {
    yield* doFetch();
  }
}

/// 分页数据加载的方法
///
/// [DbResultType] 数据库存储的数据类型
///
/// [NetResultType] 网络请求返回的数据类型
///
/// [loadFromDb] 从数据库获取数据
///
/// [createReqNetParamByPage] 创建网络请求的Bean
///
/// [fetchNet] 访问网络的请求
///
/// [insertDb] 将网络数据保存数据
///
/// [net2DbResultConvert]  网络数据转换成数据库保存的数据类型
///
/// [firstRefresh] 第一次调用该方法时，是否直接发送刷新列表的请求
///
/// [initPageIndex] 服务器请求分页的初始页数，默认是0
///
///  [Listing]
///
/// Created by Siy on 2020-3-30 11:17:06
Listing<DbResultType> loadDataByPage<DbResultType, ReqNetParam>(
    {@required Stream<DbResultType> loadFromDb(),
    @required ReqNetParam createReqNetParamByPage(int pageIndex),
    @required Future<DbResultType> fetchNet(ReqNetParam reqNetParam),
    @required Future<void> insertDb(DbResultType dbResultType, bool isRefresh),
    bool firstRefresh = true,
    int initPageIndex = 0}) {
  //当前请求的页面
  var page = initPageIndex;
  //当前什么操作，默认是刷新
  var isRefresh = true;

  //加载更多的状态,用来标识是否还可以加载更多，只有END才不可以加载更多
  // ignore: close_sinks
  final loadStatus = BehaviorSubject<PageRes>();
  PageStatus loadMore;
  //刷新状态
  // ignore: close_sinks
  final refreshStatus = BehaviorSubject<Resource>();

  final performPage = (DbResultType list) {
    if (list is List) {
      if (list.isNullOrEmpty()) {
        loadMore = PageStatus.END;
      } else {
        loadMore = PageStatus.COMPLETE;

        page += 1;
      }
    } else {
      loadMore = PageStatus.FAILE;
    }
  };

  // ignore: close_sinks
  final pageChannel = BehaviorSubject<int>();
  final listFlow = pageChannel.map((pageIndex) {
    return createReqNetParamByPage(pageIndex);
  }).switchMap((reqNetParam) {
    return loadData(
        loadFromDb: loadFromDb,
        fetch: () => fetchNet(reqNetParam),
        saveCallResult: (dbResultType) async {
          performPage(dbResultType);
          return insertDb(dbResultType, isRefresh);
        });
  }).switchMap((value) async* {
    Resource<DbResultType> resource;
    if (value.status == Status.LOADING && value.data == null) {
      //当loading的data为null时去数据找一下
      final dbValue = await loadFromDb().firstWithDefault();
      resource = Resource(value.status, dbValue, value.message);
    } else {
      resource = value;
    }
    yield resource;
  }).map((value) {
    switch (value.status) {
      case Status.LOADING:
        if (isRefresh) {
          refreshStatus.sink.add(Resource.loading(value.data));
        } else {
          loadStatus.sink.add(PageRes.loading(value.data));
        }
        break;

      case Status.FAILE:
        if (isRefresh) {
          refreshStatus.sink.add(Resource.faile(value.data, value.message));
        }

        //无论是刷新还是加载更多，都需要知道是否可以加载更多
        if (loadMore != null) {
          loadStatus.sink.add(PageRes(loadMore, value.data, value.message));
        } else {
          loadStatus.sink.add(PageRes.faile(value.data, value.message));
        }
        break;
      case Status.SUCCESS:
        if (isRefresh) {
          refreshStatus.sink.add(Resource.success(value.data));
        }

        //无论是刷新还是加载更多，都需要知道是否可以加载更多
        if (loadMore != null) {
          loadStatus.sink.add(PageRes(loadMore, value.data, value.message));
        } else {
          loadStatus.sink.add(PageRes.faile(value.data, value.message));
        }
        break;
    }
    return value.data;
  });

  final refreshFunc = () {
    isRefresh = true;
    page = initPageIndex;
    pageChannel.sink.add(page);
  };

  final loadDataFunc = () {
    isRefresh = false;
    loadMore = null;
    pageChannel.sink.add(page);
  };

  if (firstRefresh) {
    refreshFunc();
  }

  return Listing<DbResultType>(
      listFlow, refreshFunc, loadDataFunc, loadStatus, refreshStatus);
}
