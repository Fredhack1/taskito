import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskito/controllers/board_controller.dart';
import 'package:taskito/view/components/custom_button.dart';
import 'package:taskito/view/components/custom_dropdown_list.dart';
import 'package:taskito/view/components/custom_textfield.dart';

class CreateBoardPage extends StatelessWidget {
  const CreateBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    BoardController boardController = Get.put(BoardController());
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
                      "Create Board",
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
                        // Board name
                        CustomTextField(
                          controller: boardController.boardNameController,
                          hintText: "Board Name...",
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

                        // Kind of board Dropdown list
                        CustomDropdownList(
                          label: "Type of board",
                          onSelected: (val) =>
                              boardController.selectedCategory.value = val,
                          dropdownMenuEntries:
                              boardController.categories.map((category) {
                            return DropdownMenuEntry<Category>(
                              value: category,
                              label: categoriesLabel[category],
                              style: MenuItemButton.styleFrom(
                                  foregroundColor:
                                      Theme.of(context).colorScheme.primary),
                            );
                          }).toList(),
                        ),

                        // Add or edit task button
                        GetBuilder(
                          builder: (BoardController boardController) {
                            if (boardController
                                .boardNameController.text.isNotEmpty) {
                              return CustomButton(
                                color: Theme.of(context).colorScheme.secondary,
                                onTap: () {
                                  boardController.addBoard(
                                    boardController
                                        .boardNameController.value.text,
                                    boardController.selectedCategory.value,
                                  );
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
