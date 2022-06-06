import 'dart:async';
import 'package:movie_app/database/local/entity/movie_entity.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHandler {
  Future<Database> initDB() async {
    return openDatabase(
      join(await getDatabasesPath(), 'movies_entity.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE movies(id INTEGER PRIMARY KEY, poster_path TEXT, overview TEXT, backdrop_path TEXT, original_title TEXT, popularity REAL, title TEXT, vote_average REAL, vote_count INTEGER)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertMovie(MovieEntity movieEntity) async {
    final db = await initDB();
    await db.insert(
      'movies',
      movieEntity.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<MovieEntity>> movies() async {
    final db = await initDB();

    final List<Map<String, dynamic>> maps = await db.query('movies');

    return List.generate(maps.length, (i) {
      return MovieEntity(
        id: maps[i]['id'],
        popularity: maps[i]['popularity'],
        overview: maps[i]['overview'],
        originalTitle: maps[i]['original_title'],
        posterPath: maps[i]['poster_path'],
        title: maps[i]['title'],
        voteAverage: maps[i]['vote_average'],
        voteCount: maps[i]['vote_count'],
        backdropPath: maps[i]['backdrop_path'],
      );
    });
  }

  Future<void> updateMovie(MovieEntity movieEntity) async {
    // Get a reference to the database.
    final db = await initDB();

    // Update the given Dog.
    await db.update(
      'movies',
      movieEntity.toMap(),
      where: 'id = ?',
      whereArgs: [movieEntity.id],
    );
  }

  Future<void> deleteMovie(int id) async {
    final db = await initDB();
    await db.delete(
      'movies',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

