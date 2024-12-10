import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:reserv_plus/screens/menu_screen/update_date_screen.dart';

import '../../provider/data_provider.dart';
import '../load_anim_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final dateProvider = Provider.of<DateProvider>(context);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(226, 223, 204, 1),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.03),
            const Text(
              "Вітаемо,\nМикола",
              style: TextStyle(
                height: 1.1,
                fontSize: 28,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            GestureDetector(
              onTap: () async {
                await dateProvider.updateDate();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UpdateDateScreen()));
              },
              child: buildMenuItem(
                  const Icon(Icons.notifications_outlined), "Оповіщення"),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoadAnimScreen()));
              },
              child: buildMenuItem(const Icon(Icons.question_answer_outlined),
                  "Питання та відповіді"),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoadAnimScreen()));
              },
              child: buildMenuItem(const Icon(Icons.sms_failed_outlined),
                  "Виправити дані онлайн"),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoadAnimScreen()));
              },
              child: buildMenuItem(const Icon(Icons.settings), "Налаштування"),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const LoadAnimScreen()));
              },
              child: buildMenuItem(const Icon(Icons.exit_to_app), "Вийти"),
            ),
            SizedBox(height: size.height * 0.03),
            Divider(
              color: Colors.grey[400],
              thickness: 1.0,
            ),
            SizedBox(height: size.height * 0.03),
            const Text(
              "Копіювати номер пристою",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: size.height * 0.02),
            const Text(
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
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
