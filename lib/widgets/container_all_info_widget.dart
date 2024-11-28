import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isContainerVisible = false;

  // Функция для показа и скрытия контейнера
  void _toggleContainer() {
    setState(() {
      _isContainerVisible = !_isContainerVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Контейнер с анимацией')),
      body: GestureDetector(
        onTap: () {
          if (_isContainerVisible) {
            _toggleContainer(); // Закрытие контейнера при клике на экран
          }
        },
        child: Stack(
          children: [
            // Основной экран с кнопкой
            Center(
              child: ElevatedButton(
                onPressed: _toggleContainer,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange),
                child: Text('Нажми меня'),
              ),
            ),
            // Затемняющий фон
            if (_isContainerVisible)
              AnimatedOpacity(
                duration: Duration(milliseconds: 300),
                opacity: 0.5,
                child: Container(
                  color: Colors.black,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            // Анимация для контейнера
            AnimatedPositioned(
              duration: Duration(milliseconds: 300),
              bottom: _isContainerVisible
                  ? 200
                  : -400, // Контейнер едет снизу
              left: 0,
              right: 0,
              child: AnimatedScale(
                duration: Duration(milliseconds: 300),
                scale: _isContainerVisible
                    ? 1.0
                    : 1.0, // Контейнер немного сжимается при скрытии
                child: Container(
                  color: Colors.blue,
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Контейнер с текстом!!!!!!!!!!!!',
                    style:
                        TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
