import 'package:taskito/models/task_category.dart';

class TaskCategoriesDatabase {
  List<TaskCategory> _taskCategories = [
    TaskCategory(name: "Personal"),
    TaskCategory(name: "Work"),
    TaskCategory(name: "Private"),
    TaskCategory(name: "Meeting"),
    TaskCategory(name: "Events"),
    TaskCategory(name: " Create Board", isSterile: true),
  ];

  List<TaskCategory> get taskCategories => _taskCategories;
}
