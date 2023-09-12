import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  ImageSlider({super.key, required this.image});

  List<String> image;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(itemCount: image.length, itemBuilder: (context, index, realIndex) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        height: 250,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(image[index])
            ),
            borderRadius: BorderRadius.circular(16)
        ),);
    }, options: CarouselOptions(aspectRatio: 16 / 9));
  }
}
