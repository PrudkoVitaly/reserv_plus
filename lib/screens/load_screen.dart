import 'dart:async';

import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'pin_code_screen.dart';

class LoadScreen extends StatefulWidget {
  const LoadScreen({super.key});

  @override
  State<LoadScreen> createState() => _LoadScreenState();
}

class _LoadScreenState extends State<LoadScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => PinCodeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(35, 34, 30, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 60,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/logo_invert.webp"),
                  colorFilter: ColorFilter.mode(
                    Color.fromRGBO(226, 223, 206, 1),
                    BlendMode.modulate,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Міністерство \nоборони \nУкраїни",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(226, 223, 206, 1),
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: "UkraineLight",
                letterSpacing: 2,
                height: 1.1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
