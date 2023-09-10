import 'package:flutter/material.dart';
import '../../../consts/color_palette.dart';

class HotelNumberPage extends StatelessWidget {
  const HotelNumberPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Hotel title',
            style: TextStyle(color: Colors.black),
          ),
          toolbarHeight: 50,
          backgroundColor: backgroundtheme,
          elevation: 0,
        ),
        backgroundColor: Colors.grey[200],
        body: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return HotelScreen();
            }));
  }
}

class HotelScreen extends StatelessWidget {
  const HotelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
          color: backgroundtheme, borderRadius: BorderRadius.circular(16)),
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.green,
            height: 230,
            width: 400,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            padding: const EdgeInsets.all(8),
            color: Colors.yellow,
            child: const Text(
              '5 Превосходно',
              style: TextStyle(color: Colors.orange),
            ),
          ),
          const Text(
            'Steinberg',
            style: TextStyle(fontSize: 24),
          ),
          const Text(
            'Egypt',
            style: TextStyle(fontSize: 18, color: Colors.blue),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all<double>(0),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(morebuttoncol),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'About number',
                    style: TextStyle(color: buttoncolor),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: buttoncolor,
                  )
                ],
              )),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '180 000 RUB',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              Text('за тур с переводом',
                  style: TextStyle(fontSize: 20, color: Colors.grey)),
            ],
          ),
          BottomButtonWidget()
        ],
      ),
    );
  }
}

class BottomButtonWidget extends StatelessWidget {
  const BottomButtonWidget({Key? key}) : super(key: key);

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
          child: const Text('Choose room'),
          onPressed: () {
            Navigator.pushNamed(context, '/bp');
          },
        ),
      ),
    );
  }
}
