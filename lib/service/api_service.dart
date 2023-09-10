import 'package:hotelapp/models/hotel_screen.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'api_service.g.dart';

// API URL
@RestApi(baseUrl: 'https://run.mocky.io/v3/35e0d18e-2521-4f1b-a575-f0fe366f66e3/')

abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET('/hotels')
  Future<List<HotelModel>> getHotels();
}