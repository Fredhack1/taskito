import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskito/controllers/bottom_navigation.dart';
import 'package:taskito/models/tasks_database.dart';
import 'package:taskito/models/todo_repo_impl.dart';
import 'package:taskito/models/todo_repository.dart';
import 'package:taskito/themes/theme_provider.dart';
import 'package:taskito/view/screens/add_or_edit_task_page.dart';
import 'package:taskito/view/screens/create_board_page.dart';
import 'package:taskito/view/screens/home_page.dart';
import 'package:taskito/view/screens/task_details_page.dart';
import 'package:taskito/view/screens/tasks_list_page.dart';

void main() {
  Get.put(ThemeProvider());
  Get.put(TasksDatabase());
  Get.put(BottomNavigationController());
  Get.put<TodoRepo>(TodoRepoImpl());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeProvider _themeProvider = Get.put(ThemeProvider());
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GetMaterialApp(
        title: 'Taskito',
        debugShowCheckedModeBanner: false,
        theme: _themeProvider.currentTheme,
        initialRoute: '/home',
        getPages: [
          GetPage(
            name: '/home',
            page: () => HomePage(),
          ),
          GetPage(
            name: '/create-board',
            page: () => const CreateBoardPage(),
          ),
          GetPage(
            name: '/tasks-list',
            page: () => const TasksListPage(),
          ),
          GetPage(
            name: '/task-form',
            page: () => const AddOrEditTaskPage(),
          ),
          GetPage(
            name: '/task-details',
            page: () => const TaskDetailPage(),
          ),
        ],
      );
    });
  }
}
