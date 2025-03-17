import 'package:flutter/material.dart';

class TaskCategory {
  final String name;
  final String? type;
  final IconData? icon;
  final bool isSterile;

  TaskCategory(
      {required this.name, this.type, this.icon, this.isSterile = false});
}
