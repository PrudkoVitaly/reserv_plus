import 'package:flutter/material.dart';

class SupportService extends StatelessWidget {
  const SupportService({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(226, 223, 204, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(226, 223, 204, 1),
        leading: IconButton(
          padding: const EdgeInsets.only(left:15),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 26,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment:  CrossAxisAlignment.start,
          children: [
            const Text(
              "Служба підтримки",
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: size.height * 0.015),
            const Text(
              "Напишіть у чат-бот, якщо у вас\nвиникли проблеми або питання.\nПрацюемо цілодобово.",
              style: TextStyle(
                height: 1.1,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: size.height * 0.035),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Image.asset(
                      "images/viber.png",
                      width: 30,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Viber",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
