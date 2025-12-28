import 'package:flutterself/backend/models/task.dart';
import 'package:flutterself/backend/models/task_model.dart';
import 'package:flutterself/backend/services/hive_service.dart';
import 'package:flutterself/backend/task_repository/task_repository_interface.dart';

class TaskRepositoryImplementation extends TaskRepository {
  final HiveService _hiveService;
  TaskRepositoryImplementation(this._hiveService);
  @override
  Future<void> createTask(Task task) async {
    await _hiveService.addTask(TaskModel.fromEntity(task));
  }

  @override
  Future<void> deleteTask(String id) async {
    await _hiveService.deleteTask(id);
  }

  @override
  Future<List<Task>> filterByCategory(TaskCategory category) async {
    final allTasks = await getAllTasks();
    return allTasks.where((task) {
      return task.category == category;
    }).toList();
  }

  @override
  Future<List<Task>> filterByPriority(TaskPriority priority) async {
    final allTask = await getAllTasks();
    return allTask.where((task) {
      return task.priority == priority;
    }).toList();
  }

  @override
  Future<List<Task>> filterByStatus(bool isCompleted) async {
    final allTask = await getAllTasks();
    return allTask.where((task) {
      return task.isCompleted == isCompleted;
    }).toList();
  }

  @override
  Future<List<Task>> getAllTasks() {
    throw UnimplementedError();
  }

  @override
  Future<List<Task>> getOverDueTasks() async {
    final allTasks = await getAllTasks();
    return allTasks.where((task) {
      return task.isOverDue;
    }).toList();
  }

  @override
  Future<List<Task>> getTaskDueForToday() async {
    final allTasks = await getAllTasks();
    return allTasks.where((task) {
      return task.isDueToday;
    }).toList();
  }

  @override
  Future<Task?> getTaskbyId(String id) async {
    final task = _hiveService.getTaskById(id);
    return task?.toEntity();
  }

  @override
  Future<List<Task>> searchTask(String query) async {
    final allTasks = await getAllTasks();
    final lowerQuery = query.toLowerCase();

    return allTasks.where((task) {
      return task.title.contains(lowerQuery) ||
          task.description.contains(lowerQuery);
    }).toList();
  }

  @override
  Future<void> updateTask(Task task) async {
    await _hiveService.updateTask(TaskModel.fromEntity(task));
  }

  @override
  Stream<List<Task>> watchTasks() {
    return _hiveService.watchTasks().map((event) {
      final models = _hiveService.getAllTasks();
      return models.map((e) {
        return e.toEntity();
      },).toList();
    });
  }
}
