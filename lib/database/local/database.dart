import 'dart:io';

import 'package:movie_app/database/local/table/movie.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';

class DBProvider {
  static final DBProvider db = DBProvider._init();

  factory DBProvider() {
    return db;
  }

  DBProvider._init();
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDB('movies.db');
      return _database!;
    }
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    // Directory appDocDir = await getApplicationDocumentsDirectory();
    final path = join(dbPath, filePath);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    const textType = 'TEXT';
    await db.execute('''CREATE TABLE 
    $tableMovies (
    ${MovieFields.poster_path} ${textType},
    ${MovieFields.adult} BOOLEAN,
    ${MovieFields.overview} ${textType},
    ${MovieFields.backdrop_path} ${textType},
    ${MovieFields.release_date} ${textType},
    ${MovieFields.genre_ids} ${textType},
    ${MovieFields.id} INTEGER PRIMARY KEY,
    ${MovieFields.original_title} ${textType},
    ${MovieFields.original_language} ${textType},
    ${MovieFields.popularity} REAL,
    ${MovieFields.title} ${textType},
    ${MovieFields.video} BOOLEAN,    
    ${MovieFields.vote_average} REAL,
    ${MovieFields.vote_count} INTEGER,
    )
    ''');
  }

  Future<Movie> create(Movie movie) async {
    final database = await db.database;
    // final json = movie.toJson();
    // final columns = '${MovieFields.adult}';
    // final values = '${json[MovieFields.adult]}';
    // final id = await database.rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');
    final id = await database.insert(tableMovies, movie.toJson());
    return movie.copy(id: id);
  }
  Future<Movie> readMovie(int id) async{
    final database = await db.database;
    final maps = await database.query(tableMovies, columns: MovieFields.values, where: '${MovieFields.id} = ?', whereArgs: [id]);
    if(maps.isNotEmpty){
      return Movie.fromJson(maps.first);
    }else{
      throw Exception('ID $id not found');
    }

  }

  Future<List<Movie>> readAllMovies() async{
    final database = await db.database;
    final result = await database.query(tableMovies);
    return result.map((e) => Movie.fromJson(e)).toList();
  }

  Future close() async {
    final database = await db.database;
    db.close();
  }
}
