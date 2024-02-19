import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../MemoList.dart';

final String tableName = 'memos';

class DBHelper {
  // Database?_database;
  var _database;

  Future<Database> get database async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'memos.db');

    if( _database != null) return _database!;

    _database = openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute(
          """
          CREATE TABLE memos(
              title TEXT, 
              text TEXT, 
              createdTime TEXT, 
              editedTime TEXT
            )
          """,
        );
      },
      version: 1,
    );
    return _database;
  }

  // 메모 등록
  Future<void>  insertMemo(Memo memo) async {
    final db = await database;
    
    await db.insert(
      tableName,
      memo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }


}