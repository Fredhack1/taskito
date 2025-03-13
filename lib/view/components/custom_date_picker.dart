import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskito/controllers/date_controller.dart';

class CustomDatePicker extends StatelessWidget {
  final DateController dateController;
  const CustomDatePicker({super.key, required this.dateController});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Dropdown list for days
        Expanded(
          child: Obx(
            () => _buildDropdow(
              context: context,
              label: "Jour",
              value: dateController.selectedDay.value,
              items: dateController.days,
              onChanged: (value) => dateController.selectedDay.value = value,
            ),
          ),
        ),
        const SizedBox(width: 10),

        // Dropdown list for months
        Expanded(
          child: Obx(
            () => _buildDropdow(
              context: context,
              label: "Mois",
              value: dateController.selectedMonth.value,
              items: List.generate(12, (index) => index + 1),
              onChanged: (value) {
                dateController.selectedMonth.value = value;
                dateController.updateDays();
              },
              itemLabel: (item) => dateController.months[item - 1],
            ),
          ),
        ),
        const SizedBox(width: 10),

        // Dropdown list for years
        Expanded(
          child: Obx(
            () => _buildDropdow(
              context: context,
              label: "Année",
              value: dateController.selectedYear.value,
              items: dateController.years,
              onChanged: (value) {
                dateController.selectedYear.value = value;
                dateController.updateDays();
              },
            ),
          ),
        ),
      ],
    );
  }
}

Widget _buildDropdow<T>({
  required BuildContext context,
  required String label,
  required T? value,
  required List<T> items,
  required ValueChanged<T?> onChanged,
  String Function(T)? itemLabel,
}) {
  return Container(
    // padding: const EdgeInsets.only(left: 10, right: 20, top: 5, bottom: 5),
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    margin: const EdgeInsets.only(bottom: 15.0),
    // width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.surface,
      borderRadius: BorderRadius.circular(10),
    ),
    child: DropdownMenu<T>(
      width: MediaQuery.of(context).size.width / 3.5,
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
      initialSelection: value,
      onSelected: onChanged,
      dropdownMenuEntries: items.map((item) {
        return DropdownMenuEntry(
          value: item,
          label: itemLabel != null ? itemLabel(item) : "$item",
          style: MenuItemButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.primary,
          ),
        );
      }).toList(),
    ),
  );
}
