import 'package:http/http.dart' as http;

import '../models/hotel_room_info.dart';

class RoomService {
  Future<HotelRoom?> getRooms() async {
    var client = http.Client();
    var uri = Uri.parse('https://run.mocky.io/v3/f9a38183-6f95-43aa-853a-9c83cbb05ecd');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return hotelRoomFromJson(json);
    }
  }
}