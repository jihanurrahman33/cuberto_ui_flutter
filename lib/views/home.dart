import 'package:cuberto_ui_flutter/controllers/home_controller.dart';
import 'package:cuberto_ui_flutter/utils/colors.dart';
import 'package:cuberto_ui_flutter/views/receive.dart';
import 'package:cuberto_ui_flutter/views/send.dart';
import 'package:cuberto_ui_flutter/views/token_screen/token_screen.dart';
import 'package:cuberto_ui_flutter/widget/crypto_custom_listtile.dart';
import 'package:cuberto_ui_flutter/widget/custom_crypto_card.dart';
import 'package:cuberto_ui_flutter/widget/custom_home_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.finalDataBody});
  final List<dynamic> finalDataBody;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Homecontroller());
    double totalBal = 0;
    totalBal = controller.calculateBal(controller.dataBodyFinal);
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        actions: const [
          Icon(
            Icons.qr_code,
            color: Colors.white,
            size: 30,
          )
        ],
        leading: const Icon(
          Icons.search,
          color: Colors.white,
          size: 30,
        ),
        backgroundColor: AppColor.backgroundColor,
        title: const Text(
          'Wallet 1',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 170,
              height: 30,
              // padding: EdgeInsets.all(20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color(0xff1B1A1A),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '0X3748f...',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.copy,
                    color: Color(
                      0xff7AA522,
                    ),
                    size: 15,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              '\$$totalBal',
              style: const TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomHomeButton(
                  buttonWidth: 150,
                  buttonText: 'Send',
                  onTap: () {
                    Get.to(SendScreen(
                      finalDataBody: widget.finalDataBody,
                    ));
                  },
                  buttonColor: AppColor.primaryColor,
                  buttonIcon: Icons.arrow_outward,
                ),
                const SizedBox(
                  width: 20,
                ),
                CustomHomeButton(
                  buttonWidth: 150,
                  buttonText: 'Receive',
                  buttonIconColor: Colors.white,
                  buttonTextColor: Colors.white,
                  buttonIcon: Icons.arrow_downward,
                  onTap: () {
                    Get.to(const ReceiveScreen());
                  },
                  buttonColor: const Color(0xff4322EF),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomCryptoCard(
                finalDataBody: widget.finalDataBody,
              ),
            ),
            Container(
              height: 305,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    30,
                  ),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Activity',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    const Divider(),
                    Expanded(
                      child: FutureBuilder(
                        future: controller.fetchData(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text('Error: ${snapshot.error}'),
                            );
                          } else {
                            final data = snapshot.data;
                            controller.getData();
                            return ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              itemCount: data!.length,
                              itemBuilder: (context, index) => Card(
                                margin: const EdgeInsets.all(1),
                                color: Colors.white,
                                child: CryptoCustomListtile(
                                  onTap: () {
                                    Get.to(
                                      TokenScreen(
                                        data: data,
                                        index: index,
                                      ),
                                    );
                                  },
                                  index: index,
                                  finalDataBody: data,
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: 0,
        selectedItemColor: AppColor.primaryColor,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_balance_wallet,
                size: 35,
              ),
              label: ''),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.table_chart,
              size: 35,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings_rounded,
              size: 35,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
