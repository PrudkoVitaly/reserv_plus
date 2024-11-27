import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(226, 223, 204, 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      child: const Text(
                        "Резерв",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          // height: 1,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 6,
                      right: -22,
                      child: Image.asset(
                        "images/res_plus.png",
                        width: 23,
                        color: const Color.fromRGBO(253, 135, 12, 1),
                      ),
                    ),
                  ],
                ),
                // Container(
                //   width: 150,
                //   height: 100,
                //   child: Image.asset(
                //     "images/reserve_logo.png",
                //     // height: 100,
                //   ),
                // ),
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
            const SizedBox(height: 40),
            Container(
              width: double.infinity,
              height: 590,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color.fromRGBO(156, 152, 135, 1),
                  width: 1.5,
                ),
                color: const Color.fromRGBO(212, 210, 189, 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            const Text(
                              textAlign: TextAlign.center,
                              "Військово\n-обліковий\nдокумент",
                              style: TextStyle(
                                fontSize: 38,
                                fontWeight: FontWeight.w500,
                                height: 1.0,
                              ),
                            ),
                            const Spacer(),
                            Container(
                              height: 60,
                              width: 60,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "images/logo_invert.webp"),
                                  colorFilter: ColorFilter.mode(
                                    Color.fromRGBO(212, 210, 189, 1),
                                    BlendMode.darken,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Image.asset(
                              "images/ok_icon.png",
                              width: 20,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "Дані уточнено вчасно",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                height: 1.1,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Дата народження:",
                          style: TextStyle(
                            // color: Color.fromRGBO(93, 90, 75, 1),
                            // color: Color.fromRGBO(111, 108, 91, 1),
                            color: Color.fromRGBO(106, 103, 88, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            height: 1.1,
                          ),
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          "13.11.1987",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            height: 1.1,
                            wordSpacing: 0.1,
                            letterSpacing: 0.1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 90),
                  Container(
                    width: double.infinity,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(150, 148, 134, 1),
                    ),
                    child: Marquee(
                      text:
                          'Виключено - Документ оновлений 0 14:06 | 07.11.2024',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      scrollAxis:
                          Axis.horizontal, // Прокрутка по горизонтали
                      crossAxisAlignment: CrossAxisAlignment.center,
                      blankSpace:
                          50.0, // Пробел между концом и началом текста
                      velocity: 40.0, // Скорость прокрутки текста
                      startPadding:
                          10.0, // Отступ перед началом текста
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Не військовозобов'язаний",
                              style: TextStyle(
                                // color: Color.fromRGBO(93, 90, 75, 1),
                                // color: Color.fromRGBO(111, 108, 91, 1),
                                color:
                                    Color.fromRGBO(106, 103, 88, 1),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                height: 1.1,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              textAlign: TextAlign.start,
                              "Марченко\nМикола\nВолодимирович",
                              style: TextStyle(
                                fontSize: 34,
                                fontWeight: FontWeight.w500,
                                height: 1.0,
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Color.fromRGBO(253, 135, 12, 1),
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(10),
                          ),
                          onPressed: () {},
                          child: Image.asset(
                            "images/three_dots.png",
                            width: 30,
                          ),
                        ),
                      ],
                    ),
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
