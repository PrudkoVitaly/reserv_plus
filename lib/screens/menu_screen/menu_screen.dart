import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(226, 223, 204, 1),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.03),
            Text(
              "Вітаемо,\nМикола",
              style: TextStyle(
                height: 1.1,
                fontSize: 28,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            buildMenuItem(
                const Icon(Icons.notifications_outlined), "Оповіщення"),
            buildMenuItem(const Icon(Icons.question_answer_outlined),
                "питання та відповіді"),
            buildMenuItem(const Icon(Icons.sms_failed_outlined),
                "Виправити дані онлайн"),
            buildMenuItem(const Icon(Icons.settings), "Налаштування"),
            buildMenuItem(const Icon(Icons.exit_to_app), "Вийти"),
            SizedBox(height: size.height * 0.03),
            Divider(
              color: Colors.grey[400],
              thickness: 1.0,
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              "Копіювати номер пристою",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: size.height * 0.02),
            Text(
              "Служба підтримки",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(Icon icon, String title) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
         Icon(icon.icon, size: 26),
          const SizedBox(width: 15),
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
