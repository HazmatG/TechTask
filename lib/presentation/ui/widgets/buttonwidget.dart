import 'package:flutter/material.dart';

import '../../../consts/color_palette.dart';

class BottomButtonWidget extends StatelessWidget {
  BottomButtonWidget({Key? key, required this.buttontitle}) : super(key: key);

  String buttontitle;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 70,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        color: backgroundtheme,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(buttoncolor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)))),
          child: Text(buttontitle),
          onPressed: () {},
        ),
      ),
    );
  }
}
