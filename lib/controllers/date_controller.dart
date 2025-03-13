import 'package:get/get.dart';

class DateController extends GetxController {
  var selectedDay = Rxn<int>();
  var selectedMonth = Rxn<int>(DateTime.now().month);
  var selectedYear = Rxn<int>(DateTime.now().year);

  var days = <int>[].obs;
  List<String> months = [
    "Janvier",
    "Février",
    "Mars",
    "Avril",
    "Mai",
    "Juin",
    "Juillet",
    "Août",
    "Septembre",
    "Octobre",
    "Novembre",
    "Décembre"
  ];
  var years = List.generate(25, (index) => DateTime.now().year + index);

  // @override
  // void onInit() {
  //   super.onInit();
  //   selectedMonth.value = DateTime.now().month;
  //   selectedYear.value = years.first;
  //   updateDays();
  // }

  DateController() {
    updateDays(); // Mise à jour dès la création
  }

  void updateDays() {
    if (selectedMonth.value != null && selectedYear.value != null) {
      int daysInMonth =
          DateTime(selectedYear.value!, selectedMonth.value! + 1, 0).day;
      days.value = List.generate(daysInMonth, (index) => index + 1);
      if (!days.contains(selectedDay.value)) {
        selectedDay.value = DateTime.now()
            .day; // Réinitialiser si la valeur actuelle est invalide
      }
    }
  }

  int getDaysInMonth(int month, int year) {
    if (month == 2) {
      // Vérifier si l'année est bissextile
      return (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)) ? 29 : 28;
    }
    if ([4, 6, 9, 11].contains(month)) {
      return 30;
    }
    return 31;
  }
}
