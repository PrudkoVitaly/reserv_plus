import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reserv_plus/provider/data_provider.dart';
import 'package:reserv_plus/screens/load_screen.dart';
import 'package:reserv_plus/screens/main_screen/main_screen.dart';

import 'delete.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => DateProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MainScreen(),
      // home: HomeScreen3(),
    );
  }
}
