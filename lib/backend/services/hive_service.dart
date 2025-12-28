import 'package:flutterself/backend/models/task_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static const String _taskBoxName = "tasks";
  Box<TaskModel>? _taskBox;
  Future<void> init() async {
    await Hive.initFlutter();
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(TaskModelAdapter());
    }
    _taskBox = await Hive.openBox(_taskBoxName);
  }

  Box<TaskModel> get taskBox {
    if (_taskBox == null || !_taskBox!.isOpen) {
      throw Exception("Hive is not initialized. call init() first.");
    }
    return _taskBox!;
  }

  List<TaskModel> getAllTasks() {
    return taskBox.values.toList();
  }

  TaskModel? getTaskById(String id) {
    return taskBox.get(id);
  }

  Future<void> addTask(TaskModel task) async {
    await taskBox.put(task.id, task);
  }

  Future<void> updateTask(TaskModel task) async {
    await taskBox.put(task.id, task);
  }

  Future<void> deleteTask(String id) async {
    await taskBox.delete(id);
  }

  Future<void> deleteAllTasks() async {
    await taskBox.clear();
  }

  Stream<BoxEvent> watchTasks() {
    return taskBox.watch();
  }

  Future<void> close() async {
    await _taskBox?.close();
  }
}
