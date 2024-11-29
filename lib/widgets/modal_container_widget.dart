import 'package:flutter/material.dart';

class ModalContainerWidget extends StatelessWidget {
  final String text;

  const ModalContainerWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          height: 1.0,
        ),
      ),
    );
  }
}
