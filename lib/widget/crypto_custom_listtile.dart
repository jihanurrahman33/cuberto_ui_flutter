import 'package:cuberto_ui_flutter/controllers/home_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CryptoCustomListtile extends StatelessWidget {
  final int index;
  final void Function() onTap;
  final List<dynamic> finalDataBody;

  const CryptoCustomListtile({
    super.key,
    required this.index,
    required this.finalDataBody,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Homecontroller());
    return InkWell(
      onTap: onTap,
      child: ListTile(
        // horizontalTitleGap: 0,
        textColor: Colors.black,
        leading: Image.network(
          finalDataBody[index]['icon_url'],
          height: 40,
          width: 40,
        ),
        title: Text(
          finalDataBody[index]['crypto_name'],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Row(
          children: [
            Text(
              finalDataBody[index]['price'].toString(),
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(
              width: 10,
            ),
            finalDataBody[index]['increase_rate'] != null
                ? Text(
                    finalDataBody[index]['increase_rate'],
                    style: const TextStyle(color: Colors.green),
                  )
                : Text(
                    finalDataBody[index]['decrease'],
                    style: const TextStyle(color: Colors.red),
                  ),
            finalDataBody[index]['increase_rate'] != null
                ? const Icon(
                    Icons.arrow_upward,
                    color: Colors.green,
                  )
                : const Icon(
                    Icons.arrow_downward,
                    color: Colors.red,
                  ),
          ],
        ),
        trailing: Column(
          children: [
            Text(
              finalDataBody[index]['wallet-bal-crypto'].toString(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              '${controller.calculateBalFiat(finalDataBody[index])}',
              style: const TextStyle(color: Colors.black, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
