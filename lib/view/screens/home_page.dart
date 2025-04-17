import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:taskito/controllers/bottom_navigation.dart';
import 'package:taskito/view/screens/board_screen.dart';
import 'package:taskito/view/screens/done_tasks_screen.dart';
import 'package:taskito/view/screens/settings_screen.dart';
import 'package:taskito/view/screens/user_profile_screen.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Widget> _pages = [
    const BoardScreen(),
    const DoneTasksScreen(),
    const SpaceBottomNavigationBar(),
    const UserProfileScreen(),
    SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    // Initialisation du controller Getx injecté depuis main.dart
    BottomNavigationController bottomNavigationController =
        Get.find<BottomNavigationController>();
    // final bottomNavigationController = Get.put(BottomNavigationController());

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 95,
              padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(22),
                  bottomRight: Radius.circular(22),
                ),
              ),
              // Board title and filter icon button
              child: Obx(
                  () => _pages[bottomNavigationController.selectedIndex.value]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: GetBuilder<BottomNavigationController>(
                builder: (bottomNavigationController) {
                  return CupertinoTabBar(
                    currentIndex:
                        bottomNavigationController.selectedIndex.value,
                    onTap: bottomNavigationController.changeIndex,
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    border: const Border(top: BorderSide.none),
                    items: [
                      BottomNavigationBarItem(
                          icon: Icon(
                            CupertinoIcons.rectangle_3_offgrid_fill,
                            size: 30,
                            color: bottomNavigationController
                                        .selectedIndex.value ==
                                    0
                                ? Theme.of(context).colorScheme.onSurface
                                : Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withOpacity(0.5),
                          ),
                          label: ''),
                      BottomNavigationBarItem(
                        icon: Icon(
                          CupertinoIcons.checkmark_shield_fill,
                          size: 30,
                          color:
                              bottomNavigationController.selectedIndex.value ==
                                      1
                                  ? Theme.of(context).colorScheme.onSurface
                                  : Theme.of(context)
                                      .colorScheme
                                      .onSurface
                                      .withOpacity(0.5),
                        ),
                        label: '',
                      ),
                      // Space beetween navigation items
                      const BottomNavigationBarItem(
                          icon: SizedBox(width: 10), label: ''),
                      BottomNavigationBarItem(
                        icon: Icon(
                          CupertinoIcons.person,
                          size: 30,
                          color:
                              bottomNavigationController.selectedIndex.value ==
                                      3
                                  ? Theme.of(context).colorScheme.onSurface
                                  : Theme.of(context)
                                      .colorScheme
                                      .onSurface
                                      .withOpacity(0.5),
                        ),
                        label: '',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          CupertinoIcons.settings_solid,
                          size: 30,
                          color:
                              bottomNavigationController.selectedIndex.value ==
                                      4
                                  ? Theme.of(context).colorScheme.onSurface
                                  : Theme.of(context)
                                      .colorScheme
                                      .onSurface
                                      .withOpacity(0.5),
                        ),
                        label: '',
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerEndContained,
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
        disabledElevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(
            color: Theme.of(context).colorScheme.onSurface,
            width: 2,
          ),
        ),
        child: IconButton(
          onPressed: () =>
              Get.toNamed('/task-form', arguments: {'task-id': -1}),
          icon: Icon(
            Icons.add,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}

class SpaceBottomNavigationBar extends StatelessWidget {
  const SpaceBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Not Found !'));
  }
}
