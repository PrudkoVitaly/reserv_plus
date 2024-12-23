import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:reserv_plus/provider/bottom_nav_bar_provider.dart';
import 'package:reserv_plus/provider/data_provider.dart';
import 'package:reserv_plus/screens/load_screen.dart';
import 'package:reserv_plus/screens/main_screen/main_screen.dart';

import 'main_screen_delete.dart';
import 'screens/vacancies_screen/vacancies_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [
      SystemUiOverlay.top,
      SystemUiOverlay.bottom
    ], // Включаем обе панели
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DateProvider()),
        ChangeNotifierProvider(create: (_) => BottomNavBarProvider()),
      ],
      child:  const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: MainScreenDelete(),
      // home: MainScreen(),
      initialRoute: "/",
      routes:  {
        '/': (context) => const LoadScreen(),
        '/mainScreen': (context) => const MainScreen(),
        '/vacanciesScreen': (context) => const VacanciesScreen(),
      },
    );
  }
}
