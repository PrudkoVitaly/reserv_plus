import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'registry_information_screen.dart';

class PinCodeScreen extends StatefulWidget {
  @override
  _PinCodeScreenState createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> {
  final int pinLength = 4; // Длина пин-кода
  List<String> enteredPin = []; // Хранение введённых символов

  void onNumberPressed(String number) {
    if (enteredPin.length < pinLength) {
      setState(() {
        enteredPin.add(number);
      });

      // Проверка, если пин-код введён полностью
      if (enteredPin.length == pinLength) {
        // Логика проверки пин-кода
        if (enteredPin.join() == "1234") {
          // Правильный пин-код
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => RegistryInformationScreen(),
            ),
          );
        } else {
          // Неправильный пин-код
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Неправильный пин-код!')),
          );
          setState(() {
            enteredPin.clear(); // Очистить введённые символы
          });
        }
      }
    }
  }

  void onDeletePressed() {
    if (enteredPin.isNotEmpty) {
      setState(() {
        enteredPin.removeLast();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(226, 223, 204, 1),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(20),
        child: AppBar(
          backgroundColor: Color.fromRGBO(226, 223, 204, 1),
        ),
      ),
      body: Column(
        children: [
          // Заголовок
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Align(
              alignment: Alignment.topLeft,
              child: const Text(
                'Код для входу',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SizedBox(height: 80),

          // Индикаторы (точки)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              pinLength,
              (index) => Container(
                margin: EdgeInsets.all(14),
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  color: index < enteredPin.length
                      ? Colors.black
                      : Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          SizedBox(height: 80),

          // Кнопки
          buildNumberPad(),

          // Ссылка "Не пам’ятаю код"
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: GestureDetector(
              onTap: () {
                // Логика для восстановления кода
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Восстановление кода')),
                );
              },
              child: Text(
                'Не пам’ятаю код для входу',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Виджет с кнопками цифр
  Widget buildNumberPad() {
    return Column(
      children: [
        for (var i = 0; i < 3; i++)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (j) {
              int number = i * 3 + j + 1;
              return buildNumberButton(number.toString());
            }),
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                style: IconButton.styleFrom(
                  shape: CircleBorder(),
                  foregroundColor: Colors.white,
                  iconSize: 58,
                  padding: EdgeInsets.all(0),
                ),
                onPressed: () {},
                icon: Icon(Icons.fingerprint_sharp)),

            // Кнопка 0
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: buildNumberButton('0')),

            // Кнопка удаление
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                // Цвет фона кнопки
                borderRadius: BorderRadius.circular(12),
                // Закругление углов
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                onPressed: () => onDeletePressed(),
                icon: Icon(
                  Icons.close,
                  color: Colors.black,
                  size: 24,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Кнопка с числом
  Widget buildNumberButton(String number) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: GestureDetector(
        onTap: () => onNumberPressed(number),
        child: CircleAvatar(
          radius: 40,
          backgroundColor: Colors.white,
          child: Text(
            number,
            style:
                TextStyle(fontSize: 38, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
