import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

import 'home_screen.dart';
import 'main_screen/main_widgets/container_all_Info.dart';
import 'modal_person_info.dart';
import 'registry_information_screen.dart';

class PinCodeScreen extends StatefulWidget {
  @override
  _PinCodeScreenState createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> {
  bool _isContainerVisible = false;

  // Функция для показа и скрытия контейнера
  void _toggleContainer() {
    setState(() {
      _isContainerVisible = !_isContainerVisible;
    });
  }

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
  void initState() {
    Future.delayed(Duration(milliseconds: 300), () {
      _toggleContainer();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        if (_isContainerVisible) {
          _toggleContainer(); // Закрытие контейнера при клике на экран
        }
      },
      child: Stack(
        children: [
          Scaffold(
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
          ),
          // Затемняющий фон
          if (_isContainerVisible)
            AnimatedOpacity(
              alwaysIncludeSemantics: true,
              duration: const Duration(milliseconds: 900),
              opacity: 0.5,
              child: Container(
                color: Colors.black,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          // Анимация для контейнера
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            bottom: _isContainerVisible ? 0 : -400,
            // Контейнер едет снизу
            left: 0,
            right: 0,
            child: AnimatedScale(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              scale: _isContainerVisible
                  ? 1.0
                  : 1.0, // Контейнер немного сжимается при скрытии
              child: Container(
                margin: const EdgeInsets.all(6),
                padding: const EdgeInsets.all(20),
                height: size.height * 0.4,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 40,
                      alignment: Alignment.center,
                      child: Marquee(
                        // text: 'Виключено - Документ оновлений 0 ${dateProvider.currentDate.hour}:${dateProvider.currentDate.minute}:${dateProvider.currentDate.second} | ${dateProvider.currentDate.day}.${dateProvider.currentDate.month}.${dateProvider.currentDate.year}',
                        text: "Вхід за біометричними даними",
                        fadingEdgeStartFraction: 0.2,
                        fadingEdgeEndFraction: 0.2,
                        style: const TextStyle(
                          fontSize: 20,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        scrollAxis: Axis.horizontal,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        blankSpace: 100.0,
                      ),
                    ),
                    SizedBox(height: 40),
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(35, 34, 30, 1),
                      ),
                      child: Icon(
                        Icons.fingerprint,
                        size: 50,
                        color: Color.fromRGBO(70, 164, 164, 1.0),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Приконнектитесь к сканеру отпечатков пальцев.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[600],
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            _isContainerVisible = false;
                          });
                        },
                        child: Text(
                          "СКАСУВАТИ",
                          style: TextStyle(
                            color: Color.fromRGBO(70, 164, 164, 1.0),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: GestureDetector(
        onTap: () => onNumberPressed(number),
        child: CircleAvatar(
          radius: 40,
          backgroundColor: Colors.white,
          child: Text(
            number,
            style: TextStyle(fontSize: 38, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
