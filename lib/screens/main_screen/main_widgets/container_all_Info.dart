import 'package:flutter/material.dart';

class ContainerAllInfo extends StatelessWidget {
  final IconData icon;
  final String title;
  const ContainerAllInfo(
      {super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 30,
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
