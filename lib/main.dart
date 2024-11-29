import 'package:flutter/material.dart';
import 'package:reserv_plus/screens/main_screen/main_screen.dart';

import 'screens/delete.dart';
import 'screens/load_screen.dart';
import 'widgets/container_all_info_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MainScreen(),
      // home: CustomScreen(),
    );
  }
}
