import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadAnimScreen extends StatelessWidget {
  const LoadAnimScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Center(
        child: LoadingAnimationWidget.staggeredDotsWave(color: Color.fromRGBO(253, 135, 12, 1), size: 70)
      ),
    );
  }
}
