import 'package:equatable/equatable.dart';

enum TaskPriority {
  low,
  medium,
  high;

  String get displayName {
    switch (this) {
      case TaskPriority.low:
        return "Low";
      case TaskPriority.medium:
        return "Medium";
      case TaskPriority.high:
        return "High";
    }
  }
}

enum TaskCategory {
  work,
  personal,
  shopping,
  health,
  other;

  String get displayName {
    switch (this) {
      case TaskCategory.work:
        return "Work";
      case TaskCategory.personal:
        return "Personal";
      case TaskCategory.shopping:
        return "Shopping";
      case TaskCategory.health:
        return "Health";
      case TaskCategory.other:
        return "Other";
    }
  }
}

class Task extends Equatable {
  final String id;
  final String title;
  final String description;
  final bool isCompleted;
  final TaskPriority priority;
  final TaskCategory category;
  final DateTime createdAt;
  final DateTime? dueDate;
  const Task({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.priority,
    required this.category,
    required this.createdAt,
     this.dueDate,
  });

  Task copyWith({
    String? id,
    String? title,
    String? description,
    bool? isCompleted,
    TaskPriority? priority,
    TaskCategory? category,
    DateTime? createdAt,
    DateTime? dueDate,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      priority: priority ?? this.priority,
      category: category ?? this.category,
      createdAt: createdAt ?? this.createdAt,
      dueDate: dueDate ?? this.dueDate,
    );
  }

  bool get isOverDue {
    if (dueDate == null || isCompleted) return false;
    return DateTime.now().isAfter(dueDate!);
  }

  bool get isDueToday {
    if (dueDate == null || isCompleted) return false;
    final now = DateTime.now();
    return now.year == dueDate!.year &&
        now.month == dueDate!.month &&
        now.day == dueDate!.day;
  }

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    isCompleted,
    priority,
    category,
    createdAt,
    dueDate,
  ];
  @override
  String toString() {
    return "Task {id: $id, title: $title, description: $description, isCompleted: $isCompleted, priority: $priority, category: $category}";
  }
}
