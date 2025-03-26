import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:taskito/controllers/task_controller.dart';

class CustomDropdownList extends StatelessWidget {
  final String label;
  final void Function(dynamic)? onSelected;
  final List<DropdownMenuEntry> dropdownMenuEntries;
  dynamic initialSelection;
  CustomDropdownList(
      {super.key,
      required this.label,
      this.initialSelection,
      this.onSelected,
      required this.dropdownMenuEntries});

  @override
  Widget build(BuildContext context) {
    // Injection de TaskController
    // final TaskController taskController = Get.put(TaskController());

    return Container(
      padding: const EdgeInsets.only(left: 10, right: 20),
      margin: const EdgeInsets.only(bottom: 15.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownMenu(
        width: MediaQuery.of(context).size.width - 80,
        trailingIcon: Icon(
          Icons.arrow_drop_down,
          color: Theme.of(context).colorScheme.primary,
        ),
        selectedTrailingIcon: Icon(
          Icons.arrow_drop_up,
          color: Theme.of(context).colorScheme.primary,
        ),
        textStyle: TextStyle(
          color: Theme.of(context).colorScheme.primary,
        ),
        menuStyle: MenuStyle(
          backgroundColor: MaterialStateProperty.all(
            Theme.of(context).colorScheme.surface,
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: InputBorder.none,
        ),
        initialSelection: initialSelection,
        label: Text(
          label,
          style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
        ),
        onSelected: onSelected,
        dropdownMenuEntries: dropdownMenuEntries,
      ),
    );
  }
}
