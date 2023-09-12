import 'package:flutter/material.dart';

import '../../../consts/color_palette.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({Key? key, required this.textfield, required this.controller, required this.newValue}) : super(key: key);

  String textfield;
  final String newValue;
  TextEditingController controller = TextEditingController();

  FocusNode myFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        decoration: BoxDecoration(
          color: backgroundbgtheme,
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextFormField(
          validator: (value) {
            if (value!.isEmpty) return 'Это поле обязательно';
          },
          onChanged: (value) {
            value = value;
          },
          controller: controller,
            focusNode: myFocusNode,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(0),
                prefixIconConstraints: const BoxConstraints(
                    maxHeight: 20, minWidth: 22),
                border: InputBorder.none,
                labelText: textfield,
                labelStyle: TextStyle(
                    color: myFocusNode.hasFocus ? Colors.blue : Colors.black
                )
        )));
  }
}
