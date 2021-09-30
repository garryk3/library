abstract class IDatabase {
  Future<void> open();

  Future<void> initialize();

  Future<int>? insert(
    String table,
    Map<String, dynamic> values,
  );

  Future<List<Map<String, dynamic>>>? query(
    String table, {
    bool? distinct,
    List<String>? columns,
    String? where,
    List<dynamic>? whereArgs,
    String? groupBy,
    String? having,
    String? orderBy,
    int? limit,
    int? offset,
  });

  Future<int>? update(
    String table,
    Map<String, dynamic> values, {
    String where,
    List<dynamic> whereArgs,
  });

  Future<void>? execute(
    String sql, [
    List<dynamic>? arguments,
  ]);

  Future<int>? delete(
    String table, {
    String? where,
    List<dynamic>? whereArgs,
  });

  Future<List<Map<String, Object?>>>? rawQuery(
    String sql, [
    List<Object?>? arguments,
  ]);

  void close();
}
