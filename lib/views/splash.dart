import 'package:cuberto_ui_flutter/controllers/home_controller.dart';
import 'package:cuberto_ui_flutter/utils/colors.dart';
import 'package:cuberto_ui_flutter/views/home.dart';
import 'package:cuberto_ui_flutter/widget/custom_arrow_button.dart';
import 'package:cuberto_ui_flutter/widget/splash_screen_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  List<dynamic> finalDataBody = [];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Homecontroller());
    void getData() async {
      final data = await controller.fetchData();
      finalDataBody = data;
    }

    getData();
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'lib/assets/images/splash1.png',
            alignment: Alignment.centerLeft,
            fit: BoxFit.contain,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30),
            child: Column(
              children: [
                SplashScreenText(
                  mainText: 'Real ',
                  richText: 'web3',
                  mainTextColor: Colors.white,
                  richTextColor: Color(0xffD3FC7B),
                ),
                SplashScreenText(
                  mainText: 'money',
                  richText: ' -',
                  mainTextColor: Color(0xffD3FC7B),
                  richTextColor: Colors.white,
                ),
                SplashScreenText(
                  mainText: 'issued by',
                  richText: ' Nishak',
                  mainTextColor: Colors.white,
                  richTextColor: Colors.white,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              const Icon(
                Icons.abc,
                color: Colors.white,
              ),
              const SizedBox(),
              const SizedBox(),
              CustomArrowButton(
                onTap: () {
                  Get.offAll(
                    HomeScreen(
                      finalDataBody: finalDataBody,
                    ),
                  );
                },
                icon: Icons.arrow_forward,
                color: Colors.black,
                bgColor: AppColor.primaryColor,
                size: 20,
                height: 60,
                width: 60,
              ),
              const SizedBox(),
            ],
          ),
          const SizedBox(),
        ],
      ),
    );
  }
}
