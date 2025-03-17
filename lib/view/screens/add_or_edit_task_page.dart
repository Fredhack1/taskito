import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskito/controllers/task_controller.dart';
import 'package:taskito/controllers/date_controller.dart';
import 'package:taskito/models/task_category.dart';
import 'package:taskito/view/components/custom_button.dart';
import 'package:taskito/view/components/custom_date_picker.dart';
import 'package:taskito/view/components/custom_textfield.dart';
import 'package:taskito/view/components/custom_dropdown_list.dart';

class AddOrEditTaskPage extends StatelessWidget {
  const AddOrEditTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Injection des Controllers
    final TaskController taskController = Get.put(TaskController());
    final DateController startDateController = DateController();
    final DateController endDateController = DateController();
    // Récupérer les arguments passées lors de la navigation
    final Map arguments = Get.arguments ?? {};
    final String pageTitle = arguments['pageTitle'] ?? "No Title";
    // Form state
    // final _formState = GlobalKey<FormState>();

    return GestureDetector(
      onTap: () {
        WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                  top: 25.0,
                ),
                color: Colors.transparent,
                height: 140.0,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                    Text(
                      pageTitle,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 140.0,
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(22),
                    topRight: Radius.circular(22),
                  ),
                ),
                child: ListView(
                  padding: const EdgeInsets.only(top: 0.0),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Task title
                        CustomTextField(
                          controller: taskController.titleController,
                          hintText: "Task title...",
                          obscureText: false,
                          inputType: TextInputType.text,
                          maxLines: 1,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a task title';
                            }
                            return null;
                          },
                        ),
                        // Task description
                        CustomTextField(
                          controller: taskController.descriptionController,
                          hintText: "Task description...",
                          obscureText: false,
                          inputType: TextInputType.multiline,
                          maxLines: 3,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a task description';
                            }
                            return null;
                          },
                        ),
                        // Task status with dropdown list
                        CustomDropdownList(
                          label: "Task status",
                          onSelected: (newValue) =>
                              taskController.selectedStatus.value = newValue!,
                          dropdownMenuEntries:
                              taskController.statues.map((status) {
                            return DropdownMenuEntry<TaskStatus>(
                              value: status,
                              label: statusLabel[status]!,
                              style: MenuItemButton.styleFrom(
                                foregroundColor:
                                    Theme.of(context).colorScheme.primary,
                              ),
                            );
                          }).toList(),
                        ),

                        // Task categories with dropdown list
                        CustomDropdownList(
                          label: "Task Categories",
                          onSelected: (val) =>
                              taskController.selectedCategory.value = val,
                          dropdownMenuEntries: taskController.categories
                              .where((category) => !category.isSterile)
                              .map((category) {
                            return DropdownMenuEntry<TaskCategory>(
                              value: category,
                              label: category.name,
                              style: MenuItemButton.styleFrom(
                                  foregroundColor:
                                      Theme.of(context).colorScheme.primary),
                            );
                          }).toList(),
                        ),

                        // Start date
                        Padding(
                          padding: const EdgeInsets.only(left: 10, bottom: 5),
                          child: Text(
                            "Start date",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        CustomDatePicker(
                          dateController: startDateController,
                        ),

                        // End date
                        Padding(
                          padding: const EdgeInsets.only(left: 10, bottom: 5),
                          child: Text(
                            "End date",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        CustomDatePicker(
                          dateController: endDateController,
                        ),

                        // Add or edit task button
                        GetBuilder(
                          builder: (TaskController taskController) {
                            if (taskController
                                    .titleController.text.isNotEmpty &&
                                taskController
                                    .descriptionController.text.isNotEmpty) {
                              return CustomButton(
                                color: Theme.of(context).colorScheme.secondary,
                                onTap: () {
                                  var startDate = DateTime(
                                    startDateController.selectedYear.value ?? 0,
                                    startDateController.selectedMonth.value ??
                                        0,
                                    startDateController.selectedDay.value ?? 0,
                                  );
                                  var endDate = DateTime(
                                    endDateController.selectedYear.value ?? 0,
                                    endDateController.selectedMonth.value ?? 0,
                                    endDateController.selectedDay.value ?? 0,
                                  );
                                  taskController.addTask(
                                      taskController.titleController.value.text,
                                      taskController
                                          .descriptionController.value.text,
                                      taskController.selectedStatus.value,
                                      taskController.selectedCategory.value,
                                      startDate,
                                      endDate);
                                },
                                text: "Add Task",
                              );
                            } else {
                              return CustomButton(
                                color: Theme.of(context).colorScheme.tertiary,
                                onTap: null,
                                text: "Add Task",
                              );
                            }
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
