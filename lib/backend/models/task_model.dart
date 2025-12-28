import "package:flutterself/backend/models/task.dart";
import "package:hive/hive.dart";
part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  late String id;
  @HiveField(1)
  late String title;
  @HiveField(2)
  late String description;
  @HiveField(3)
  late bool isCompleted;
  @HiveField(4)
  late int priority;
  @HiveField(5)
  late int category;
  @HiveField(6)
  late DateTime createdAt;
  @HiveField(7)
  DateTime? dueDate;
  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.priority,
    required this.category,
    required this.createdAt,
    this.dueDate,
  });
  factory TaskModel.fromEntity(Task task) {
    return TaskModel(
      id: task.id,
      title: task.title,
      description: task.description,
      isCompleted: task.isCompleted,
      priority: task.priority.index,
      category: task.category.index,
      createdAt: task.createdAt,
      dueDate: task.dueDate,
    );
  }
  Task toEntity() {
    return Task(
      id: id,
      title: title,
      description: description,
      isCompleted: isCompleted,
      priority: TaskPriority.values[priority],
      category: TaskCategory.values[category],
      createdAt: createdAt,
      dueDate: dueDate,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "isCompleted": isCompleted,
      "priority": priority,
      "category": category,
      "createdAt": createdAt.toIso8601String(),
      "dueDate": dueDate?.toIso8601String(),
    };
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json["id"] as String,
      title: json["title"] as String,
      description: json["description"] as String,
      isCompleted: json["isCompleted"] as bool,
      priority: json["priority"] as int,
      category: json["category"] as int,
      createdAt: DateTime.parse(json["createdAt"] as String),
      dueDate: json["dueDate"] != null
          ? DateTime.parse(json['dueDate'] as String)
          : null,
    );
  }
}
