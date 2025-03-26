import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskito/controllers/status_color_controller.dart';

class TaskTile extends StatelessWidget {
  final String status;
  final String title;
  final String description;
  final String startDate;
  final String endDate;
  final Function()? onTap;
  const TaskTile({
    super.key,
    required this.title,
    required this.description,
    required this.status,
    required this.onTap,
    required this.startDate,
    required this.endDate,
  });

  void _showStatusChanger(
      BuildContext context, StatusColorController controller) {
    String selectedStatus = status;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.surface,
        surfaceTintColor: Theme.of(context).colorScheme.surface,
        title: Text(
          "Change task's status",
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w500),
        ),
        content: SizedBox(
          height: MediaQuery.of(context).size.height / 4.5,
          child: Column(
            children: [
              CheckboxListTile(
                side: BorderSide(color: Theme.of(context).colorScheme.primary),
                title: Text(
                  "À faire",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                value: selectedStatus == 'à faire',
                onChanged: (bool? value) {
                  if (value == true) {
                    selectedStatus = 'à faire';
                  }
                },
              ),
              CheckboxListTile(
                side: BorderSide(color: Theme.of(context).colorScheme.primary),
                title: Text(
                  "En cours",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                value: selectedStatus == 'en cours',
                onChanged: (bool? value) {
                  if (value == true) {
                    selectedStatus = 'en cours';
                  }
                },
              ),
              CheckboxListTile(
                side: BorderSide(color: Theme.of(context).colorScheme.primary),
                title: Text(
                  "Terminé",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                value: selectedStatus == 'terminé',
                onChanged: (bool? value) {
                  if (value == true) {
                    selectedStatus = 'terminé';
                  }
                },
              ),
            ],
          ),
        ),
        actions: [
          // Cancel Button
          TextButton(
            onPressed: () => Get.back(),
            child: const Text("Cancel"),
          ),
          // Add Button
          TextButton(
            onPressed: () {
              // Mettre à jour l'état de la tâche
              controller.updateStatus(selectedStatus);
              Get.back();
            },
            child: const Text("Update"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    StatusColorController statusColorController =
        Get.put(StatusColorController());
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(
            top: 15.0, left: 20.0, right: 20.0, bottom: 15.0),
        margin: const EdgeInsets.only(bottom: 15.0),
        width: MediaQuery.of(context).size.width,
        // height: 160,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Task status
            InkWell(
              onTap: () => _showStatusChanger(context, statusColorController),
              child: Text(
                status.toUpperCase(),
                style: TextStyle(
                  color: statusColorController.getStatusColor(context, status),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Divider(
              thickness: 1,
              color: Theme.of(context).colorScheme.tertiary.withOpacity(0.5),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    color: Theme.of(context).colorScheme.surface,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Status' Color Indicator Bar
                        Container(
                          margin: const EdgeInsets.only(right: 10.0),
                          width: 3,
                          height: 70,
                          color: statusColorController.getStatusColor(
                              context, status),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Task Title
                              Text(
                                title,
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                                softWrap: true,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),

                              // Task Description
                              RichText(
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: description,
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .tertiary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Option Icon
                Container(
                  color: Theme.of(context).colorScheme.surface,
                  width: 15,
                  child: InkWell(
                    onTap: () =>
                        _showStatusChanger(context, statusColorController),
                    // onTap: () {
                    //   showPopover(
                    //     context: context,
                    //     bodyBuilder: (context) => Text(
                    //       'Popover Body',
                    //       style: TextStyle(
                    //           color: Theme.of(context).colorScheme.tertiary),
                    //     ),
                    //     onPop: () => print('Popover was popped!'),
                    //     direction: PopoverDirection.bottom,
                    //     width: 200,
                    //     height: 400,
                    //     arrowHeight: 15,
                    //     arrowWidth: 30,
                    //   );
                    // },
                    child: Icon(
                      Icons.more_vert,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            // Due date
            Row(
              children: [
                Icon(
                  CupertinoIcons.clock,
                  color: Theme.of(context).colorScheme.tertiary,
                  size: 20,
                ),
                const SizedBox(width: 5),
                Text(
                  startDate,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Text(
                  " – ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Text(
                  endDate,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
