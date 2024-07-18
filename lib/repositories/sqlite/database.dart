import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

Map<int, String> scripts = {
  1: '''CREATE TABLE cadPessoa (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT NOT NULL,
        pesoAtual INTEGER,
        dataNascimento DATE NOT NULL,
        nivelAtividade TEXT NOT NULL,
        objetivos TEXT NOT NULL,
        altura INTEGER
  ); ''',
  2: ''' CREATE TABLE IF NOT EXISTS pesoAtualizadoPessoa (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  idPessoa INTEGER,
  pesoAtualizado INTEGER,
  FOREIGN KEY (idPessoa) REFERENCES cadPessoa (id)
);''',
};

class SQLiteDatabase {
  static Database? db;

  Future<Database> obterDatabase() async {
    if (db == null) {
      return await IniciarBancoDeDados();
    } else {
      return db!;
    }
  }

  Future<Database> IniciarBancoDeDados() async {
    var db = await openDatabase(
        path.join(await getDatabasesPath(), 'database.db'),
        version: scripts.length, onCreate: (Database db, int version) async {
      for (var i = 1; i <= scripts.length; i++) {
        await db.execute(scripts[i]!);
      }
    }, onUpgrade: (Database db, int oldVersion, int newVersion) async {
      for (var i = oldVersion + 1; i <= scripts.length; i++) {
        await db.execute(scripts[i]!);
      }
    });
    return db;
  }
}
