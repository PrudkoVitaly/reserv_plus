import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';

import '../../provider/data_provider.dart';
import '../main_screen/main_screen.dart';
import '../main_screen/main_widgets/container_all_Info.dart';
import '../modal_person_info.dart';
import '../request_sent_load_screen/request_sent_load_screen.dart';

class DefaultMainScree extends StatefulWidget {
  const DefaultMainScree({super.key});

  @override
  State<DefaultMainScree> createState() => _DefaultMainScreeState();
}

class _DefaultMainScreeState extends State<DefaultMainScree>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _scaleAnimation;
  bool _showFront = true;

  bool _isContainerVisible = false;

  // Функция для показа и скрытия контейнера
  void _toggleContainer() {
    setState(() {
      _isContainerVisible = !_isContainerVisible;
    });
  }

  @override
  void initState() {
    super.initState();

    // Инициализация контроллера
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    // Анимация вращения
    _rotationAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Анимация сжатия (масштабирование)
    _scaleAnimation = TweenSequence([
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: 0.8)
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 50, // Сжатие до середины
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.8, end: 1.0)
            .chain(CurveTween(curve: Curves.easeIn)),
        weight: 50, // Возвращение к нормальному размеру
      ),
    ]).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  void _flipCard() {
    if (_showFront) {
      _controller.forward(); // Начинаем анимацию
    } else {
      _controller.reverse(); // Обратная анимация
    }
    setState(() {
      _showFront = !_showFront;
    });
  }

  @override
  Widget build(BuildContext context) {
    final dateProvider = Provider.of<DateProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(226, 223, 204, 1),
      body: GestureDetector(
        onTap: () {
          if (_isContainerVisible) {
            _toggleContainer(); // Закрытие контейнера при клике на экран
          }
        },
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 50),
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
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  // height: 1,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 6,
                              right: -20,
                              child: Image.asset(
                                "images/res_plus.png",
                                width: 20,
                                color: const Color.fromRGBO(253, 135, 12, 1),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Text(
                          "Сканувати \nдокумент",
                          style: TextStyle(
                            height: 1,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(width: 6),
                        Image.asset(
                          "images/qr.png",
                          width: 30,
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    // Військово-обліковий документ
                    GestureDetector(
                      onTap: _flipCard,
                      child: AnimatedBuilder(
                        animation: _controller,
                        builder: (context, child) {
                          // Угол поворота (по оси Y)
                          final angle =
                              _rotationAnimation.value * 3.1415926535897932;

                          // Проверка, какая сторона должна быть видна
                          final isFrontVisible =
                              angle <= 3.1415926535897932 / 2;

                          return Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()
                              ..setEntry(3, 2, 0.001) // Добавление перспективы
                              ..rotateY(angle), // Вращение по оси Y
                            child: Transform.scale(
                              scale: _scaleAnimation.value,
                              // Сжатие перед сменой
                              child: isFrontVisible
                                  ? _buildFrontContainer()
                                  : Transform(
                                      alignment: Alignment.center,
                                      transform:
                                          Matrix4.rotationY(3.1415926535897932),
                                      child: _buildBackContainer(),
                                    ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Затемняющий фон
            if (_isContainerVisible)
              AnimatedOpacity(
                alwaysIncludeSemantics: true,
                duration: const Duration(milliseconds: 900),
                opacity: 0.5,
                child: Container(
                  color: Colors.black,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            // Анимация для контейнера
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              bottom: _isContainerVisible ? -5 : -400,
              // Контейнер едет снизу
              left: 0,
              right: 0,
              child: AnimatedScale(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                scale: _isContainerVisible
                    ? 1.0
                    : 1.0, // Контейнер немного сжимается при скрытии
                child: Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 5,
                        width: 45,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      const SizedBox(height: 30),
                      GestureDetector(
                        onTap: () {
                          _toggleContainer();
                          Future.delayed(const Duration(milliseconds: 1000),
                              () {
                            ShowPersonInfoArguments.showPersonInfoModal(
                                context);
                          });
                        },
                        child: const ContainerAllInfo(
                          icon: Icons.info_outline,
                          title: "Повна інформація",
                        ),
                      ),
                      const SizedBox(height: 20),
                      const ContainerAllInfo(
                        icon: Icons.file_copy_outlined,
                        title: "Завантажити PDF",
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          // Provider.of<DateProvider>(context, listen: false).updateDate();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      RequestSentLoadScreen()));
                          Future.delayed(const Duration(milliseconds: 1000),
                              () {
                            dateProvider.updateDate();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainScreen()));
                          });

                          _toggleContainer();
                        },
                        child: const ContainerAllInfo(
                          icon: Icons.update,
                          title: "Оновити документ",
                        ),
                      ),
                      const SizedBox(height: 20),
                      const ContainerAllInfo(
                        icon: Icons.perm_device_info_rounded,
                        title: "Виправити дані онлайн",
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFrontContainer() {
    final dateProvider = Provider.of<DateProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Container(
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      textAlign: TextAlign.center,
                      "Військово\n-обліковий\nдокумент",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                        height: 1.0,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          // image: AssetImage("images/logo_invert.webp"),
                          image: AssetImage("images/logo_main_screen.jpg"),

                          colorFilter: ColorFilter.mode(
                              Color.fromRGBO(212, 210, 189, 1),
                              // BlendMode.darken,
                              BlendMode.difference),
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
                      width: 18,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Дані уточнено вчасно",
                      style: TextStyle(
                        fontSize: 16,
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
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    height: 1.1,
                    wordSpacing: 0.1,
                    letterSpacing: 0.1,
                  ),
                ),
              ],
            ),
          ),
          // const SizedBox(height: 90),
          SizedBox(height: size.height * 0.15),
          Container(
            width: double.infinity,
            height: 40,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(150, 148, 134, 1),
            ),
            child: Marquee(
              // text: 'Виключено - Документ оновлений 0 ${dateProvider.currentDate.hour}:${dateProvider.currentDate.minute}:${dateProvider.currentDate.second} | ${dateProvider.currentDate.day}.${dateProvider.currentDate.month}.${dateProvider.currentDate.year}',
              text:
                  "Виключено - Документ оновлений о ${dateProvider.currentDate}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(252, 251, 246, 1),
              ),
              scrollAxis: Axis.horizontal,
              // Прокрутка по горизонтали
              crossAxisAlignment: CrossAxisAlignment.center,
              blankSpace: 50.0,
              // Пробел между концом и началом текста
              velocity: 40.0,
              // Скорость прокрутки текста
              startPadding: 10.0, // Отступ перед началом текста
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Не військовозобов'язаний",
                      style: TextStyle(
                        color: Color.fromRGBO(106, 103, 88, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        height: 1.1,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      textAlign: TextAlign.start,
                      "МАРЧЕНКО\nМикола\nВолодимирович",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        height: 1.0,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(253, 135, 12, 1),
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(8),
                  ),
                  onPressed: () {
                    _toggleContainer();
                  },
                  child: Image.asset(
                    "images/three_dots.png",
                    width: 28,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackContainer() {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color.fromRGBO(156, 152, 135, 1),
          width: 1.5,
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Код дійсний до 27.11.2025",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 30),
            Image.asset(
              "images/qr_code.png",
              width: 260,
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
