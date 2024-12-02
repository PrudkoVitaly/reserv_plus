import 'package:flutter/material.dart';
import 'package:reserv_plus/screens/main_screen/main_screen.dart';

class RequestSentLoadScreen extends StatelessWidget {
  const RequestSentLoadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(226, 223, 204, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color.fromRGBO(151, 148, 131, 1),
                  width: 6,
                ),
              ),
              child: CircleAvatar(
                radius: 50,
                child: Icon(
                  Icons.check,
                  color: Colors.black,
                  size: 60,
                ),
                backgroundColor: Colors.transparent,
              ),
            ),
            SizedBox(height: 40),
            Text(
              "Запит відправлено",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              textAlign: TextAlign.center,
              "Запит на оновлення даних\nз реэстру відправлено. Ми\n сповістимо вас про результат.",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                height: 1.1,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 16.0), // Отступ от нижнего края
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9, // Ширина кнопки
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(253, 135, 12, 1),
              foregroundColor: Color.fromRGBO(22, 1, 0, 1),
              padding: EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainScreen()));
            },
            child: Text("Дякую",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
