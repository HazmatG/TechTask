import 'package:flutter/material.dart';
import 'package:hotelapp/consts/color_palette.dart';

class PeculiarityWid extends StatelessWidget {
  PeculiarityWid({super.key, required this.peculiarities, required this.index});

  final List<String> peculiarities;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(8),
      color: backgroundbgtheme,
      child: Text(peculiarities[index], style: TextStyle(color: servicecol, fontWeight: FontWeight.w500, fontSize: 16),),
    );
  }
}
