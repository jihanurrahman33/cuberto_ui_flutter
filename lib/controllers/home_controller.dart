import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Homecontroller extends GetxController {
  List<dynamic> dataBodyFinal = [];
  List<dynamic> coingeckoData = [];
  static const api =
      'https://6719c26f7fc4c5ff8f4e6092.mockapi.io/crypto_price/Crpto';
  static const coingeckoApi =
      'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false';
  Future<List<dynamic>> fetchData() async {
    final response = await http.get(Uri.parse(api));

    List<dynamic> dataBody = [];

    if (response.statusCode == 200) {
      dataBody = jsonDecode(response.body);
    } else {}
    dataBodyFinal = dataBody;

    return dataBody;
  }

  Future<List<dynamic>> getData() async {
    final response = await http.get(Uri.parse(coingeckoApi));
    List<dynamic> dataBody = [];
    if (response.statusCode == 200) {
      dataBody = jsonDecode(response.body);
      coingeckoData = dataBody;
    } else {}

    return dataBody;
  }

  double calculateBalFiat(Map<String, dynamic> cryptoItem) {
    double calculatedfiat = (cryptoItem['Price'] as num).toDouble() *
        (cryptoItem['wallet-bal-crypto'] as num).toDouble();

    return double.parse(calculatedfiat.toStringAsFixed(2));
  }

  double calculateBal(List dataBodyFinal) {
    double totalBal = 0;
    for (var item in dataBodyFinal) {
      totalBal += (item['wallet-bal-crypto'] * item['Price']);
    }

    return double.parse(totalBal.toStringAsFixed(2));
  }
}
