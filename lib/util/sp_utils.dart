

class SpUtils{

  ///单例模式的一种写法，来自于：https://stackoverflow.com/questions/54057958/comparing-ways-to-create-singletons-in-dart
  SpUtils._privateConstructor();
  static final SpUtils _instance = SpUtils._privateConstructor();
  static SpUtils get instance { return _instance;}


}