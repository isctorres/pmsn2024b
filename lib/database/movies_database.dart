import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MoviesDatabase {
  
  static final NAMEDB = 'MOVIESDB';
  static final VERSIONDB = 1;

  static Database? _database;

  Future<Database> get database async {
    if( _database != null ) return _database!;
    return _database = await initDatabase();
  }
  
  Future<Database> initDatabase() async {
    Directory folder = await getApplicationDocumentsDirectory();
    String path = join(folder.path,NAMEDB);  
    return openDatabase(
      path,
      version: VERSIONDB,
      onCreate: (db, version) {

        String query ='''
        CREATE TABLE tblgenre(
          idGenre char(1) PRIMARY KEY,
          dscgenre VARCHAR(50)  
        );

        CREATE TABLE tblmovies(
          idMovie INTEGER PRIMARY KEY,
          nameMovie VARCHAR(100),
          overview TEXT,
          idGenre char(1),
          imgMovie VARCHAR(150),
          releaseDate CHAR(10),
          CONSTRAINT fk_gen FOREIGN KEY(idGenre) REFERENCES tblgenre(idGenre)
        );''';
        db.execute(query);
      },
    );
  } // initdatabase

  Future<int> INSERT(String table, Map<String,dynamic> row) async {
    var con = await database;
    return con.insert(table, row);
  }
  Future<int> UPDATE() async {}
  Future<int> DELETE() async {}
  Future<List<MoviesDAO>> SELECT() async {}


}