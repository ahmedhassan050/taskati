import 'dart:io';

import 'package:hive_ce_flutter/adapters.dart';
import 'package:taskati2/core/models/task_model.dart';
import 'package:taskati2/core/hive/hive_registrar.g.dart';

class HiveProvider {
  static late Box _userBox;
  static late Box<TaskModel> _taskBox;
  static String userBox = "userBox";
  static String taskBox = "taskBox";
  static const String kName = "name";
  static const String kImage = 'image';
  static const String kIsDark = 'isdark';
  static Box<TaskModel> get taskbox => _taskBox;
  static Box get userbox => _userBox;
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapters();
    _userBox = await Hive.openBox(userBox);
    _taskBox = await Hive.openBox<TaskModel>(taskBox);
  }

  static Future<void> cacheData(String key, dynamic value) async {
    await _userBox.put(key, value);
  }

  static dynamic getData(String key) {
    return _userBox.get(key);
  }

  static Future<void> cacheTask(String key, TaskModel value) async {
    await _taskBox.put(key, value);
  }

  static TaskModel? getTask(String key) {
    return _taskBox.get(key);
  }

  static Future<void> cacheUserData({
    required String name,
    required String imagepath,
  }) async {
    await cacheData(HiveProvider.kName, name);
    await cacheData(HiveProvider.kImage, imagepath);
  }

  static Future<void> deleteUserData() async {
    final imagePath = _userBox.get(kImage) as String?;

    await _userBox.delete(kName);
    await _userBox.delete(kImage);

    if (imagePath != null && imagePath.isNotEmpty) {
      final file = File(imagePath);
      if (await file.exists()) {
        await file.delete();
      }
    }
  }
}
