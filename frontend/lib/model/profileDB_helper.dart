import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'file:///C:/Users/Vincent/IdeaProjects/major-group-project-size_hub/frontend/lib/data/temp/profileModel.dart';
import 'db_utils.dart';

class profileDBModel {
  Future<int> insertProfile(Profile user) async {
    final db = await DBUtils.init();
    return await db.insert(
      'userProfile',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> updateProfile(Profile user) async {
    final db = await DBUtils.init();
    return await db.update(
      'userProfile',
      user.toMap(),
      where: 'usrID = ?',
      whereArgs: [user.usrID],
    );
  }

  Future<Profile> getProfileWithId(int usrID) async {
    final db = await DBUtils.init();
    final List<Map<String, dynamic>> maps = await db.query(
      'userProfile',
      where: 'usrID = ?',
      whereArgs: [usrID],
    );
    return Profile.fromMap(maps[0]);
  }
}
