import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reserv_plus/provider/bottom_nav_bar_provider.dart';



class QuestionPage extends StatelessWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Страница с вопросом')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
          },
          child: const Text('Скрыть BottomNavigationBar'),
        ),
      ),
    );
  }
}
