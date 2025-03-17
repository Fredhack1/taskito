import 'package:taskito/models/task_category.dart';

// Task item
class Task {
  int id;
  String name;
  String description;
  String status;
  TaskCategory category;
  DateTime? startDate;
  DateTime? endDate;

  Task({
    required this.id,
    required this.name,
    required this.description,
    required this.status,
    required this.category,
    this.startDate,
    this.endDate,
  });
}

// Task Categories
// enum TaskCategory {
//   personal,
//   work,
//   private,
//   meeting,
//   events,
//   createBoard,
// }
