import 'package:flutter/material.dart';

class DateProvider extends ChangeNotifier {
  DateTime _currentDate = DateTime.now();

  DateTime get currentDate => _currentDate;

  void updateDate() {
    _currentDate = DateTime.now();
    notifyListeners(); // Уведомляем слушателей об изменении
  }
}
