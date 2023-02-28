import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ScriptDatabase {
  Future<Database> openConnection() async {
    final databasePath = await getDatabasesPath();
    final databaseFinalPath = join(databasePath, 'LISTA_DE_TAREFAS');

    return await openDatabase(
      databaseFinalPath,
      version: 1,
      onConfigure: (db) async {
        await db.execute('PRAGMA foreing_keys = ON');
      },
      onCreate: (db, version) {
        final batch = db.batch();
        batch.execute('''
                 create table tarefa(
                  id Integer primary key autoincrement,
                  name varchar(200),
                  description varchar(400)
                  situation varchar(200)
                  )
                  ''');
        batch.commit();
      },
      onUpgrade: (db, oldVersion, newVersion) {},
      onDowngrade: (db, oldVersion, newVersion) {},
    );
  }
}
