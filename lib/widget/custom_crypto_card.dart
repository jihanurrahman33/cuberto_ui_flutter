import 'package:cuberto_ui_flutter/controllers/home_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCryptoCard extends StatelessWidget {
  final List<dynamic> finalDataBody;
  const CustomCryptoCard({super.key, required this.finalDataBody});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Homecontroller());
    return Card(
      color: const Color(0xff1C1B1B),
      child: ListTile(
        textColor: Colors.white,
        leading: Image.network(
          finalDataBody[0]['icon_url'],
          height: 40,
          width: 40,
        ),
        title: Text(
          finalDataBody[0]['crypto_name'],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Row(
          children: [
            Text(
              finalDataBody[0]['price'].toString(),
              style: const TextStyle(color: Colors.white70),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              finalDataBody[0]['increase_rate'],
              style: const TextStyle(color: Colors.green),
            ),
            const Icon(
              Icons.arrow_upward,
              color: Colors.green,
            )
          ],
        ),
        trailing: Column(
          children: [
            Text(
              finalDataBody[0]['wallet-bal-crypto'].toString(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              '${controller.calculateBalFiat(finalDataBody[0])}',
              style: const TextStyle(color: Colors.white70, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
