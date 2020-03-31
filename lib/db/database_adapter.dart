import 'package:jaguar_query_sqflite/composer.dart';
import 'package:jaguar_query_sqflite/jaguar_query_sqflite.dart';
import 'package:sqflite/sqflite.dart' as sqf;

class DatabaseAdapter extends SqfliteAdapter {
  DatabaseAdapter(String path) : super(path);

  DatabaseAdapter.fromConnection(sqf.Database connection)
      : super.fromConnection(connection);

  /// 复写父类的方法，允许insert支持replace
  Future<void> insertMany<T>(InsertMany st, {bool replaceIfExist = true}) {
    String strSt = _composeInsertMany(st, replaceIfExist);
    return connection.execute(strSt);
  }

  /// 复写父类的方法，允许insert支持replace
  Future<T> insert<T>(Insert st, {bool replaceIfExist = true}) async {
    String strSt;
    if (replaceIfExist) {
      strSt = _composeInsert(st, true);
    } else {
      strSt = composeInsert(st);
    }

    return connection.rawInsert(strSt) as Future<T>;
  }
}

String _composeInsert(final Insert st, bool replaceIfExist) {
  final ImmutableInsertStatement info = st.asImmutable;
  final sb = new StringBuffer();

  sb.write('INSERT');
  if (replaceIfExist) {
    sb.write(' OR REPLACE');
  }
  sb.write(' INTO ');
  sb.write(info.table);
  sb.write('(');

  sb.write(info.values.keys.join(', '));

  sb.write(') VALUES (');
  sb.write(info.values.values.map(composeValue).join(', '));
  sb.write(')');

  return sb.toString();
}

String _composeInsertMany(final InsertMany st, bool replaceIfExist) {
  final ImmutableInsertManyStatement info = st.asImmutable;
  final sb = new StringBuffer();

  sb.write('INSERT');
  if (replaceIfExist) {
    sb.write(' OR REPLACE');
  }
  sb.write(' INTO ');
  sb.write(info.table);

  final keys = info.values[0].keys.toList();
  sb.write(' SELECT ');
  for (var i = 0; i < keys.length; ++i) {
    var key = keys[i];
    sb.write('${composeValue(info.values[0][key])} AS \'$key\'');
    if (i < keys.length - 1) {
      sb.write(', ');
    }
  }
  sb.write('\n');

  for (var i = 1; i < info.values.length; ++i) {
    final values = info.values[i];
    final keys = info.values[i].keys.toList();
    sb.write('UNION ALL SELECT ');
    for (var j = 0; j < keys.length; ++j) {
      var key = keys[j];
      sb.write('${composeValue(values[key])}');
      if (j < keys.length - 1) {
        sb.write(', ');
      }
    }
    sb.write('\n');
  }

  return sb.toString();
}
