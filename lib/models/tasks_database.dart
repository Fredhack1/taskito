import 'package:taskito/models/task.dart';
import 'package:taskito/models/task_category.dart';

class TasksDatabase {
  List<Task> tasks = [
    // D'autres tâches pour Personal
    Task(
      id: 1,
      name: 'Buy groceries',
      description: 'Go to the store and buy necessary groceries.',
      status: 'À faire',
      category: TaskCategory(name: "Personal"),
      startDate: DateTime(2025, 03, 17),
      endDate: DateTime(2025, 03, 22),
    ),
    Task(
      id: 2,
      name: 'Schedule meeting',
      description: 'Schedule a meeting with the team for the project update.',
      status: 'En cours',
      category: TaskCategory(name: "Personal"),
      startDate: DateTime(2025, 03, 17),
      endDate: DateTime(2025, 03, 22),
    ),
    Task(
        id: 3,
        name: 'Walk the dog',
        description: 'Lorem ipsum dolor sit amet, consectetur',
        status: 'En cours',
        category: TaskCategory(name: "Personal")),
    Task(
      id: 4,
      name: 'Prepare presentation',
      description:
          'Schedule a presentation with the team for the project update.',
      status: 'Terminé',
      category: TaskCategory(name: "Personal"),
    ),

    // D'autres tâches pour Work
    Task(
      id: 5,
      name: 'New Web UI Design',
      description: 'Website UI design for 100k.',
      status: 'En cours',
      category: TaskCategory(name: "Work"),
      startDate: DateTime(2025, 03, 17),
      endDate: DateTime(2025, 03, 22),
    ),
    Task(
      id: 6,
      name: 'Application Design',
      description: 'Website UI design for 250k.',
      status: 'À faire',
      category: TaskCategory(name: "Work"),
      startDate: DateTime(2025, 03, 17),
      endDate: DateTime(2025, 03, 22),
    ),
    Task(
      id: 7,
      name: 'Team meeting',
      description: 'Attend the project update meeting with the team.',
      status: 'À faire',
      category: TaskCategory(name: "Work"),
    ),
    Task(
      id: 8,
      name: 'Update code',
      description: 'Attend the project update code with the team.',
      status: 'Terminé',
      category: TaskCategory(name: "Work"),
    ),

    // D'autres tâches pour Private
    Task(
      id: 9,
      name: 'Private task 1',
      description: 'This is a personal task for self-care.',
      status: 'À faire',
      category: TaskCategory(name: "Private"),
    ),
    Task(
      id: 10,
      name: 'Private task 2',
      description: 'Start practicing meditation alone.',
      status: 'À faire',
      category: TaskCategory(name: "Private"),
    ),

    // D'autres tâches pour Meeting
    Task(
      id: 11,
      name: 'Set alarm',
      description: 'Set an alarm for the team meeting tomorrow.',
      status: 'Terminé',
      category: TaskCategory(name: "Meeting"),
    ),
    Task(
      id: 12,
      name: 'Prepare agenda',
      description: 'Schedule the agenda for the team meeting next week.',
      status: 'À faire',
      category: TaskCategory(name: "Meeting"),
    ),

    // D'autres tâches pour Events
    Task(
      id: 13,
      name: 'Plan event',
      description:
          'Organize the upcoming event for the team building activity.',
      status: 'En cours',
      category: TaskCategory(name: "Events"),
    ),
  ];
  List<Task> getTaskByCategory(TaskCategory taskCategory) {
    // List<Task> taskList = [];
    // print(tasks.length);
    // for (var task in tasks) {
    //   if (task.category.name == taskCategory.name) {
    //     taskList.add(task);
    //   }
    // }
    // print(taskList.length);

    return tasks
        .where((task) => task.category.name == taskCategory.name)
        .toList();
  }

  Task getTaskById(int id) {
    return tasks.firstWhere((element) => element.id == id);
  }

  List<Task> getTaskByStatus(String status) {
    return tasks.where((task) => task.status == status).toList();
  }
}
