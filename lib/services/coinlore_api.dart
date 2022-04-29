import 'package:cryptowo/models/cryptocurrency.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CoinloreAPI {
  String baseUrl = "https://api.coinlore.net/api/tickers";

  Future<List<Cryptocurrency>> getInfo(int start, int limit) async {
    String api = "?start=" + start.toString() + "&limit=" + limit.toString();

    http.Response response = await http.get(Uri.parse(baseUrl + api));

    try {
      if (response.statusCode == 200) {
        Map<String, dynamic> res = json.decode(response.body);
        List<dynamic> coins = res["data"];
        return coins.map((e) => Cryptocurrency.fromJson(e)).toList();
      } else {
        return <Cryptocurrency>[];
      }
    } catch (e) {
      return <Cryptocurrency>[];
    }
  }
}
