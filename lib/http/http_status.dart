///用来表示网络请求
enum Status {
  ///成功
  SUCCESS,

  ///失败
  FAILE,

  ///请求中
  LOADING
}

///一个资源请求的通用类，封装了数据，状态和附加信息
class Resource<T> {
  final Status status;
  final T data;
  final String message;

  Resource(this.status, this.data, this.message);

  factory Resource.success(T data) => Resource(Status.SUCCESS, data, null);

  factory Resource.faile(T data, String msg) =>
      Resource(Status.FAILE, data, msg);

  factory Resource.loading(T data) => Resource(Status.LOADING, data, null);
}

enum PageStatus {
  ///请求中
  LOADING,

  ///此页面请求完成
  COMPLETE,

  ///数据请求完成，没有更多数据了
  END,

  ///请求失败
  FAILE
}

class PageRes<T> {
  final PageStatus status;
  final T data;
  final String message;

  PageRes(this.status, this.data, this.message);

  factory PageRes.complete(T data) => PageRes(PageStatus.COMPLETE, data, null);

  factory PageRes.loading(T data) => PageRes(PageStatus.LOADING, data, null);

  factory PageRes.end(T data) => PageRes(PageStatus.END, data, null);

  factory PageRes.faile(T data, String msg) =>
      PageRes(PageStatus.FAILE, data, msg);
}