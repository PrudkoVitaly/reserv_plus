import 'package:flutter/material.dart';

class CircleProgressIndicator extends StatelessWidget {
  const CircleProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(226, 223, 204, 1),
      body: Center(
        child: CircularProgressIndicator(
          color: const Color.fromRGBO(226, 223, 24, 1),
          strokeWidth: 4,
          backgroundColor: Colors.black26,
          value: null,
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.black),
          strokeAlign: 1,
          strokeCap:  StrokeCap.round,
        ),
      ),
    );
  }
}
