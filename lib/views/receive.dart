import 'package:cuberto_ui_flutter/widget/custom_arrow_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';

class ReceiveScreen extends StatelessWidget {
  const ReceiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomArrowButton(
          onTap: () {
            Get.back();
          },
          icon: Icons.arrow_back_ios,
          color: Colors.white,
          size: 30,
          height: 30,
          width: 30,
        ),
        backgroundColor: const Color(0xff000000),
        title: const Text(
          'Receive',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xff000000),
      body: const Center(
        child: Text(
          'Recieve Screen',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
