import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/data_provider.dart';

class UpdateDateScreen extends StatefulWidget {
  const UpdateDateScreen({super.key});

  @override
  State<UpdateDateScreen> createState() => _UpdateDateScreenState();
}

class _UpdateDateScreenState extends State<UpdateDateScreen> {
  String? _localCurrentDate;

  @override
  void initState() {
    super.initState();
    // Сохраняем локально данные из провайдера
    final provider = Provider.of<DateProvider>(context, listen: false);
    _localCurrentDate = provider.currentDate;
  }

  @override
  Widget build(BuildContext context) {
    // final data = Provider.of<DateProvider>(context, listen: false);
    // Разделение даты и времени, если дата и время представлены через пробел
    // String reversedDate = "Дані не обновлено";
    // if (data.currentDate != null && data.currentDate.isNotEmpty) {
    //   List<String> dateParts = data.currentDate.split(' ');
    //   if (dateParts.length == 2) {
    //     reversedDate = '${dateParts[1]} ${dateParts[0]}';
    //   }
    // }
    // Локальная обработка reversedDate
    String reversedDate = '';
    if (_localCurrentDate != null && _localCurrentDate!.isNotEmpty) {
      List<String> dateParts = _localCurrentDate!.split(' ');
      if (dateParts.length == 2) {
        reversedDate = '${dateParts[1]} ${dateParts[0]}';
      }
    }
    return Scaffold(
      backgroundColor: const Color.fromRGBO(226, 223, 204, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(226, 223, 204, 1),
        leading: IconButton(
          padding: const EdgeInsets.only(left: 15),
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
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Сповіщення",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              _localCurrentDate == null || _localCurrentDate!.isEmpty
                  ? Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: const Text(
                  'Нет данных',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
                  : Center(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white54,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Данні з реєстру Оберіг отримано\n\nВійськово-обліковий документ\nвже доступний",
                          style: TextStyle(
                            height: 1.1,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Divider(
                          thickness: 1.5,
                          height: 0,
                          color: Colors.grey[300],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          reversedDate.isEmpty ? _localCurrentDate! : reversedDate,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[500],
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

                  // data.currentDate == null || data.currentDate.isEmpty
                  //     ? Container(
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(20),
                  //           color: Colors.white,
                  //         ),
                  //         child: const Text(
                  //           'Нет данных',
                  //           style: TextStyle(
                  //             fontSize: 18,
                  //             fontWeight: FontWeight.w400,
                  //           ),
                  //         ),
                  //       )
                  //     : Center(
                  //         child: Container(
                  //           width:  double.infinity,
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(20),
                  //             color: Colors.white54,
                  //           ),
                  //           child: Padding(
                  //             padding: const EdgeInsets.all(16),
                  //             child: Column(
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: [
                  //                 const Text(
                  //                   "Данні з реэстру Оберіг отримано\n\nВійськово-обліковий документ\nвже доступний",
                  //                   style: TextStyle(
                  //                     height:  1.1,
                  //                     fontSize: 18,
                  //                     fontWeight: FontWeight.w500,
                  //                   ),
                  //                 ),
                  //                 const SizedBox(height: 20),
                  //                 Divider(
                  //                   thickness: 1.5,
                  //                   height: 0,
                  //                   color: Colors.grey[300],
                  //                 ),
                  //                 const SizedBox(height: 20),
                  //                 Text(
                  //                   reversedDate.isEmpty ? '${data.currentDate}' : reversedDate,
                  //                   style: TextStyle(
                  //                     fontSize: 16,
                  //                     color: Colors.grey[500],
                  //                     fontWeight: FontWeight.w600,
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //       ),


            ],
          ),
        ),
      ),
    );
  }
}
