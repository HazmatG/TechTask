import 'package:http/http.dart' as http;

import '../models/hotel_reservation_info.dart';

class ReservationService {
  Future<HotelReserve?> getPosts() async {
    var client = http.Client();
    var uri = Uri.parse('https://run.mocky.io/v3/e8868481-743f-4eb2-a0d7-2bc4012275c8');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return hotelReserveFromJson(json);
    }
  }
}