import 'dart:async';

import 'package:flutter/material.dart';
import 'package:reserv_plus/screens/main_screen/main_screen.dart';

class RegistryInformationScreen extends StatefulWidget {
  const RegistryInformationScreen({super.key});

  @override
  State<RegistryInformationScreen> createState() =>
      _RegistryInformationScreenState();
}

class _RegistryInformationScreenState
    extends State<RegistryInformationScreen> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _screens = [
    const Center(
      child: Text(
        "Вакансії",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    ),
    const Center(
      child: Text(
        "Мій документ",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    ),
    const Center(
      child: Text(
        "Меню",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(226, 223, 204, 1),
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "images/reserve_logo.png",
                  width: 150,
                ),
                const Spacer(),
                const Text(
                  "Сканувати \nдокумент",
                  style: TextStyle(
                    height: 1,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(width: 6),
                Image.asset(
                  "images/qr.png",
                  width: 50,
                ),
              ],
            ),
            // const SizedBox(height: 0),
            Container(
              width: double.infinity,
              height: size.height * 0.71,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color.fromRGBO(156, 152, 135, 1),
                  width: 1.5,
                ),
                color: const Color.fromRGBO(212, 210, 189, 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/logo_invert.webp"),
                        colorFilter: ColorFilter.mode(
                          Color.fromRGBO(212, 210, 189, 1),
                          BlendMode.modulate,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    textAlign: TextAlign.center,
                    "Отримуємо\nінформацію з\nреєстру",
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.w500,
                      height: 1.0,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Поки ми шукаємо дані -\nперегляньте вакансії у Силах\nоборони",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      height: 1.1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Icon(
                  Icons.work_outline,
                  size: 24,
                  color:
                      _currentIndex == 0 ? Colors.black : Colors.grey,
                ),
                Text(
                  "Вакансії",
                  style: TextStyle(
                    fontSize: 14,
                    color: _currentIndex == 0
                        ? Colors.black
                        : Colors.grey,
                    fontWeight: _currentIndex == 0
                        ? FontWeight.w500
                        : FontWeight.w400,
                  ),
                ),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Icon(
                  Icons.insert_drive_file_outlined,
                  size: 24,
                  color:
                      _currentIndex == 1 ? Colors.black : Colors.grey,
                ),
                Text(
                  "Мій документ",
                  style: TextStyle(
                    fontSize: 14,
                    color: _currentIndex == 1
                        ? Colors.black
                        : Colors.grey,
                    fontWeight: _currentIndex == 1
                        ? FontWeight.w500
                        : FontWeight.w400,
                  ),
                ),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.menu,
                      size: 24,
                      color: _currentIndex == 2
                          ? Colors.black
                          : Colors.grey,
                    ),
                    Text(
                      "Меню",
                      style: TextStyle(
                        fontSize: 14,
                        color: _currentIndex == 2
                            ? Colors.black
                            : Colors.grey,
                        fontWeight: _currentIndex == 2
                            ? FontWeight.w500
                            : FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const Positioned(
                  right: 7,
                  top: 1,
                  child: CircleAvatar(
                    radius: 4,
                    backgroundColor: Colors.red,
                  ),
                ),
              ],
            ),
            label: '',
          ),
        ],
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
