import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
part 'hotel_screen.g.dart';

// HotelModel hotelModelFromJson(String str) => HotelModel.fromJson(json.decode(str));
//
// String hotelModelToJson(HotelModel data) => json.encode(data.toJson());

@JsonSerializable()
class HotelModel {
  int id;
  String name;
  String adress;
  int minimalPrice;
  String priceForIt;
  int rating;
  String ratingName;
  List<String> imageUrls;
  AboutTheHotel aboutTheHotel;

  HotelModel({
    required this.id,
    required this.name,
    required this.adress,
    required this.minimalPrice,
    required this.priceForIt,
    required this.rating,
    required this.ratingName,
    required this.imageUrls,
    required this.aboutTheHotel,
  });

  factory HotelModel.fromJson(Map<String, dynamic> json) => _$HotelModelFromJson(json);
  Map<String, dynamic> toJson() => _$HotelModelToJson(this);
}

@JsonSerializable()
class AboutTheHotel {
  String description;
  List<String> peculiarities;

  AboutTheHotel({
    required this.description,
    required this.peculiarities,
  });

  factory AboutTheHotel.fromJson(Map<String, dynamic> json) => _$AboutTheHotelFromJson(json);

  //     AboutTheHotel(
  //   description: json["description"],
  //   peculiarities: List<String>.from(json["peculiarities"].map((x) => x)),
  // );

  Map<String, dynamic> toJson() => _$AboutTheHotelToJson(this);
  //     {
  //   "description": description,
  //   "peculiarities": List<dynamic>.from(peculiarities.map((x) => x)),
  // };
}
