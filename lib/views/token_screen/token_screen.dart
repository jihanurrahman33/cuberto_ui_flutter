import 'package:cuberto_ui_flutter/widget/custom_arrow_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TokenScreen extends StatelessWidget {
  final List<dynamic> data;
  final int index;
  const TokenScreen({super.key, required this.data, required this.index});

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
        title: Text(
          data[index]['Name'],
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: Column(
              children: [
                Image(
                  image: NetworkImage(data[index]['Icon']),
                  height: 100,
                  width: 100,
                ),
                Text(
                    '${data[index]['wallet-bal-crypto']} ${data[index]['Name']}'),
                //Text(data[index][''])
              ],
            ),
          ),
        ],
      ),
    );
  }
}
