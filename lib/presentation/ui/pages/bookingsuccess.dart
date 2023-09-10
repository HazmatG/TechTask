import 'package:flutter/material.dart';
import '../../../consts/color_palette.dart';
import '../widgets/buttonwidget.dart';

class BookingSuccessful extends StatelessWidget {
  const BookingSuccessful({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Book Paid',
          style: TextStyle(color: Colors.black),
        ),
        toolbarHeight: 50,
        backgroundColor: backgroundtheme,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              CircleAvatar(
                child: Image.asset('assets/pp.png'),
                backgroundColor: Colors.grey,
                maxRadius: 40,
              ),
              const SizedBox(height: 20),
              const Text('Ваш заказ принят в работу', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),),
              const SizedBox(height: 20),
              const Text('Подтверждение заказа №104893 может занять некоторое время'
                  ' (от 1 часа до суток). Как только мы получим ответ от туроператора, '
                  'вам на почту придет уведомление.', style: TextStyle(fontSize: 16, color: Colors.grey),),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                    child: BottomButtonWidget(buttontitle: 'Супер',)),
              )
            ],
          ),
        ),
      )
    );
  }
}

