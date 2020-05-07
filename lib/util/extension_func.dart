

/// [List] 扩展方法
extension ListExtension on List {
  bool isNullOrEmpty() {
    return this == null || this.isEmpty;
  }
}

extension StreamExtension on Stream {
  Future<T> firstWithDefault<T>({T defValue}) async {
    var value = defValue;
    try {
      value = await this.first;
    } catch (e) {
      print(e.toString());
    }
    return value;
  }
}
