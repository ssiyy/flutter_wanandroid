/// [List] 扩展方法
extension ListExtension on List {
  bool isNullOrEmpty() {
    return this == null || this.isEmpty;
  }
}
