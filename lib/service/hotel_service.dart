import 'package:http/http.dart' as http;

import '../models/hotel_info.dart';

class HotelService {
  Future<HotelMode?> getHotelInfo() async {
    var client = http.Client();

    var uri = Uri.parse('https://run.mocky.io/v3/35e0d18e-2521-4f1b-a575-f0fe366f66e3');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return HotelModeFromJson(json);
    }
  }
}