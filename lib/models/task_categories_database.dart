import 'package:flutter/cupertino.dart';
import 'package:taskito/models/task_category.dart';

class TaskCategoriesDatabase {
  List<TaskCategory> _taskCategories = [
    TaskCategory(
      name: "Personal",
      icon: CupertinoIcons.person,
    ),
    TaskCategory(name: "Work", icon: CupertinoIcons.briefcase),
    TaskCategory(name: "Private", icon: CupertinoIcons.lock),
    TaskCategory(name: "Meeting", icon: CupertinoIcons.person_2),
    TaskCategory(name: "Events", icon: CupertinoIcons.calendar),
    TaskCategory(
        name: " Create Board",
        icon: CupertinoIcons.add_circled,
        isSterile: true),
  ];

  List<TaskCategory> get taskCategories => _taskCategories;
}
