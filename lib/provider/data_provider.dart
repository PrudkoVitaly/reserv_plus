import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class DateProvider extends ChangeNotifier {
//   DateTime _currentDate = DateTime.now();
//
//   DateTime get currentDate => _currentDate;
//
//   void updateDate() {
//     _currentDate = DateTime.now();
//     notifyListeners();
//   }
// }

class DateProvider extends ChangeNotifier {
  String _currentDate = 'Не обновлено';

  String get currentDate => _currentDate;

  DateProvider() {
    _loadDate(); // Загружаем дату при инициализации
  }

  Future<void> _loadDate() async {
    final prefs = await SharedPreferences.getInstance();
    final savedDate = prefs.getString('savedDate');

    if (savedDate != null) {
      _currentDate = savedDate; // Если есть сохраненная дата, используем её
    }
    notifyListeners(); // Уведомляем об изменении
  }

  Future<void> updateDate() async {
    final prefs = await SharedPreferences.getInstance();
    final now = DateTime.now();
    final newDate = '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')} | ${now.day.toString().padLeft(2, '0')}.${now.month.toString().padLeft(2, '0')}.${now.year}';

    _currentDate = newDate; // Обновляем текущее состояние
    await prefs.setString('savedDate', newDate); // Сохраняем дату
    notifyListeners(); // Уведомляем об изменении
  }
}

