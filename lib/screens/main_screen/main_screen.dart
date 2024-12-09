import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';
import 'package:reserv_plus/screens/request_sent_load_screen/request_sent_load_screen.dart';
import 'package:reserv_plus/screens/vacancies_screen/vacancies_screen.dart';

import '../../provider/data_provider.dart';
import '../../widgets/modal_container_widget.dart';
import '../default_main_screen/default_main_scree.dart';
import '../menu_screen/menu_screen.dart';
import '../modal_person_info.dart';
import 'main_widgets/container_all_Info.dart';
import 'package:page_transition/page_transition.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  bool _isContainerVisible = false;
  int _selectedIndex = 1;

  final List<Widget> _screens = [
    VacanciesScreen(),
    DefaultMainScree(),
    MenuScreen(),
  ];


// Функция для перехода с анимацией
  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 300), // Плавный переход
        child: _screens[_selectedIndex],  // Отображаем текущую страницу
      ),
      // body: IndexedStack(
      //   index: _selectedIndex,
      //   children: _screens,
      // ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: _isContainerVisible
            ? const Color.fromRGBO(106, 105, 94, 1)
            : Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onTap,
        items: [
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Icon(
                  Icons.work_outline,
                  size: 24,
                  color: _selectedIndex == 0 ? Colors.black : Colors.grey,
                ),
                Text(
                  "Вакансії",
                  style: TextStyle(
                    fontSize: 14,
                    color: _selectedIndex == 0 ? Colors.black : Colors.grey,
                    fontWeight:
                        _selectedIndex == 0 ? FontWeight.w500 : FontWeight.w400,
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
                  color: _selectedIndex == 1 ? Colors.black : Colors.grey,
                ),
                Text(
                  "Мій документ",
                  style: TextStyle(
                    fontSize: 14,
                    color: _selectedIndex == 1 ? Colors.black : Colors.grey,
                    fontWeight:
                        _selectedIndex == 1 ? FontWeight.w500 : FontWeight.w400,
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
                      color: _selectedIndex == 2 ? Colors.black : Colors.grey,
                    ),
                    Text(
                      "Меню",
                      style: TextStyle(
                        fontSize: 14,
                        color: _selectedIndex == 2 ? Colors.black : Colors.grey,
                        fontWeight: _selectedIndex == 2
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
