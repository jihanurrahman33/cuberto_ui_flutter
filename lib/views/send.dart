import 'package:cuberto_ui_flutter/utils/colors.dart';
import 'package:cuberto_ui_flutter/widget/custom_arrow_button.dart';
import 'package:cuberto_ui_flutter/widget/custom_home_button.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class SendScreen extends StatelessWidget {
  final List<dynamic> finalDataBody;
  const SendScreen({super.key, required this.finalDataBody});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
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
          'Send',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xff000000),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Please choose asset to send',
                  style: TextStyle(color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(
                        0xff1C1B1B,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    height: size.height * .5,
                    child: ListView.builder(
                      itemCount: finalDataBody.length,
                      itemBuilder: (coontext, index) => ListTile(
                        leading: Image(
                          height: 40,
                          width: 40,
                          image: NetworkImage(
                            finalDataBody[index]['Icon'],
                          ),
                        ),
                        title: Text(
                          finalDataBody[index]['Name'],
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          '${finalDataBody[index]['Price']} ${finalDataBody[index]['Name']}',
                          style: const TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            CustomHomeButton(
              buttonWidth: double.infinity,
              buttonText: 'Continue',
              onTap: () {},
              buttonColor: AppColor.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
