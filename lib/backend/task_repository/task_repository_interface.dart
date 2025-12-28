import 'package:flutterself/backend/models/task.dart';

abstract class TaskRepository {
  //
  Future<List<Task>> getAllTasks();
  Future<Task?> getTaskbyId(String id);
  Future<void> createTask(Task task);
  Future<void> updateTask(Task task);
  Future<void> deleteTask(String id);
  Future<List<Task>> searchTask(String query);
  Future<List<Task>> filterByCategory(TaskCategory category);
  Future<List<Task>> filterByPriority(TaskPriority priority);
  Future<List<Task>> filterByStatus(bool isCompleted);
  Future<List<Task>> getTaskDueForToday();
  Future<List<Task>> getOverDueTasks();
  Stream<List<Task>> watchTasks();
}
