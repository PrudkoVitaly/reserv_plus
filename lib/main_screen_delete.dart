import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reserv_plus/provider/bottom_nav_bar_provider.dart';
import 'package:reserv_plus/question_screen_delete.dart';


class MainScreenDelete extends StatelessWidget {
  const MainScreenDelete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Главный экран')),
      body: Navigator(
        onGenerateRoute: (settings) {
          Widget page = Container(); // Пустой виджет по умолчанию
          if (settings.name == '/') {
            page = Center(
              child: ElevatedButton(
                onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => const QuestionPage()));
                },
                child: const Text('Перейти к странице с вопросом'),
              ),
            );
          } else if (settings.name == '/questionPage') {
            page = const QuestionPage();
          }

          return MaterialPageRoute(builder: (_) => page);
        },
        initialRoute: '/',
      ),
      bottomNavigationBar: Consumer<BottomNavBarProvider>(
        builder: (_, provider, __) {
          return provider.isVisible
              ? BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Поиск'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль'),
            ],
          )
              : SizedBox.shrink();
        },
      ),
    );
  }
}
