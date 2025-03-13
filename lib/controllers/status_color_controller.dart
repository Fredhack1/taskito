import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatusColorController extends GetxController {
  var status = ''.obs;

  // Fonction pour obtenir la couleur de l'état
  Color getStatusColor(BuildContext context, String status) {
    switch (status) {
      case 'En cours':
        return Theme.of(context).colorScheme.onSecondary;
      case 'Terminé':
        return Theme.of(context).colorScheme.onPrimary;
      case 'À faire':
      default:
        return Theme.of(context).colorScheme.secondary;
    }
  }

  // Mettre à jour le statut de la tâche
  void updateStatus(String newStatus) {
    status.value = newStatus;
  }
}
