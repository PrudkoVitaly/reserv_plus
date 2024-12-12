import 'package:flutter/material.dart';
import 'package:reserv_plus/screens/vacancies_screen/support_service.dart';
import '../../widgets/circle_progress_indicator.dart';
import '../load_anim_screen.dart';

class VacanciesScreen extends StatefulWidget {
  const VacanciesScreen({super.key});

  @override
  State<VacanciesScreen> createState() => _VacanciesScreenState();
}

class _VacanciesScreenState extends State<VacanciesScreen> {
  bool _isChecked = false;

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
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 26, right: 26),
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.black,
                  child: IconButton(
                    iconSize: 15,
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SupportService(),
                          ));
                    },
                    icon: const Icon(
                      Icons.question_mark,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            const Text("Вакансії",
                style: TextStyle(
                  height: 1.1,
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                )),
            SizedBox(height: size.height * 0.02),
            const Text(
              "Тут знаходяться актуальні посади\nдля служби в українському\nвійську, надані у співпраці з\nплатформою Lobby X.",
              style: TextStyle(
                height: 1.1,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            const Text(
              "Це найбільший перелік\nпропозицій, який допоможе\nзнайти тут, що підходить саме\nвам. Обирайте варіанти,\nподавайте заявки у кілька кліків і\nочікуйте відповівіді від бригади",
              style: TextStyle(
                height: 1.1,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Spacer(),
            Theme(
              data: ThemeData(
                splashFactory: NoSplash.splashFactory,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
              ),
              child: CheckboxListTile(
                dense: true,
                checkColor: Colors.black,
                activeColor: const Color.fromRGBO(253, 135, 12, 1),
                value: _isChecked,
                onChanged: (bool? value) {
                  print("Checkbox clicked! Value: $value");
                  setState(() {
                    _isChecked = value!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
                // contentPadding: EdgeInsets.only(left: 60),
                title: const Text(
                  "Більше не показувати",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                backgroundColor: const Color.fromRGBO(253, 135, 12, 1),
                foregroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 60),
                elevation: 0,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CircleProgressIndicator(
                    ),
                  ),
                );
              },
              child: Text(
                "Почати",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.02),
          ],
        ),
      ),
      // else if (settings.name == '/question') {
      //   page = const QuestionPage();
      // }

      // body: Navigator(
      //   initialRoute: '/',
      //   onGenerateRoute: (settings) {
      //     Widget page = Container(); // Пустой виджет по умолчанию
      //     if (settings.name == '/') {
      //       page = Padding(
      //         padding: const EdgeInsets.all(24),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Align(
      //               alignment: Alignment.topRight,
      //               child: Padding(
      //                 padding: const EdgeInsets.only(top: 26, right: 26),
      //                 child: CircleAvatar(
      //                   radius: 15,
      //                   backgroundColor: Colors.black,
      //                   child: IconButton(
      //                     iconSize: 15,
      //                     padding: EdgeInsets.zero,
      //                     onPressed: () {
      //                       Navigator.push(
      //                           context,
      //                           MaterialPageRoute(
      //                             builder: (context) => const SupportService(),
      //                           ));
      //                     },
      //                     icon: const Icon(
      //                       Icons.question_mark,
      //                       color: Colors.white,
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //             ),
      //             const SizedBox(height: 20),
      //             const Text(
      //               "Вакансії",
      //               style: TextStyle(
      //                 fontSize: 34,
      //                 fontWeight: FontWeight.w500,
      //               ),
      //             ),
      //             const SizedBox(height: 20),
      //             const Text(
      //               "Вакансії",
      //               style: TextStyle(
      //                 fontSize: 24,
      //                 fontWeight: FontWeight.w500,
      //               ),
      //             ),
      //             const SizedBox(height: 20),
      //             const Text(
      //               "Тут знаходяться актуальні посади\nдля служби в українському\nвійську, надані у співпраці з\nплатформою Lobby X.",
      //               style: TextStyle(
      //                 height: 1.1,
      //                 fontSize: 20,
      //                 fontWeight: FontWeight.w500,
      //               ),
      //             ),
      //             const SizedBox(height: 20),
      //             const Text(
      //               "Це найбільший перелік\nпропозицій, який допоможе\nзнайти тут, що підходить саме\nвам. Обирайте варіанти,\nподавайте заявки у кілька кліків і\nочікуйте відповівіді від бригади",
      //               style: TextStyle(
      //                 height: 1.1,
      //                 fontSize: 20,
      //                 fontWeight: FontWeight.w500,
      //               ),
      //             ),
      //             Spacer(),
      //             Theme(
      //               data: ThemeData(
      //                 splashFactory: NoSplash.splashFactory,
      //                 highlightColor: Colors.transparent,
      //                 splashColor: Colors.transparent,
      //               ),
      //               child: CheckboxListTile(
      //                 dense: true,
      //                 checkColor: Colors.black,
      //                 activeColor: const Color.fromRGBO(253, 135, 12, 1),
      //                 value: _isChecked,
      //                 onChanged: (bool? value) {
      //                   print("Checkbox clicked! Value: $value");
      //                   setState(() {
      //                     _isChecked = value!;
      //                   });
      //                 },
      //                 controlAffinity: ListTileControlAffinity.leading,
      //                 contentPadding: EdgeInsets.only(left: 60),
      //                 title: const Text(
      //                   "Більше не показувати",
      //                   style: TextStyle(
      //                     fontSize: 18,
      //                   ),
      //                 ),
      //               ),
      //             ),
      //             const SizedBox(height: 20),
      //             ElevatedButton(
      //               style: ElevatedButton.styleFrom(
      //                 shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(50),
      //                 ),
      //                 backgroundColor: const Color.fromRGBO(253, 135, 12, 1),
      //                 foregroundColor: Colors.black,
      //                 minimumSize: const Size(double.infinity, 60),
      //                 elevation: 0,
      //               ),
      //               onPressed: () {},
      //               child: Text(
      //                 "Почати",
      //                 style: TextStyle(
      //                   fontSize: 20,
      //                   fontWeight: FontWeight.w500,
      //                 ),
      //               ),
      //             ),
      //             const SizedBox(height: 10),
      //           ],
      //         ),
      //       );
      //     }
      //     // else if (settings.name == '/question') {
      //     //   page = const QuestionPage();
      //     // }
      //     return MaterialPageRoute(builder: (_) => page);
      //   },
      // ),
    );
  }
}
