import 'package:cuberto_ui_flutter/views/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const Cuberto());
}

class Cuberto extends StatelessWidget {
  const Cuberto({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
