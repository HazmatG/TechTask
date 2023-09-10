import 'package:flutter/material.dart';

import '../../../consts/color_palette.dart';
import '../widgets/buttonwidget.dart';
import '../widgets/customtextfield.dart';
import '../widgets/touristform.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Booking',
          style: TextStyle(color: Colors.black),
        ),
        toolbarHeight: 50,
        backgroundColor: backgroundtheme,
        elevation: 0,
      ),
      backgroundColor: backgroundbgtheme,
      body: ListView(
        children: [
          const HotelScreen(),
          const BookingInfo(),
          const ClientNumberForm(),
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (context, index) {
                return TouristForm();
              }),
          const PriceWidget(),
          BottomButtonWidget(buttontitle: 'Оплатить'),
        ],
      ),
    );
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
          Container(height: 250, width: double.infinity, decoration: BoxDecoration(
            color: Colors.amber, borderRadius: BorderRadius.circular(16)
          ),),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 160,
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.amber[50],
                  borderRadius: BorderRadius.circular(8)),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.orange,
                  ),
                  Text(
                    '5 Превосходно',
                    style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          const Text(
            'Steigenberger Makadi',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          const Text(
            'Madinat Makadi, Safaga Road, Makadi Bay, Египет',
            style: TextStyle(fontSize: 16, color: Colors.blue, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

class BookingInfo extends StatelessWidget {
  const BookingInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: backgroundtheme),
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.all(12),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Вылет из',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                'Gorod',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Даты',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                'Gorod',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Кол-во ночей',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                'Gorod',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Отель',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                'Gorod',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Номер',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                'Gorod',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Питание',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                'Gorod',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ClientNumberForm extends StatefulWidget {
  const ClientNumberForm({Key? key}) : super(key: key);

  @override
  _ClientNumberFormState createState() => _ClientNumberFormState();
}

class _ClientNumberFormState extends State<ClientNumberForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: backgroundtheme,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Информация о покупателе',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          CustomTextField(textfield: 'Номер телефона'),
          CustomTextField(textfield: 'Почта'),
          const Text(
            'Эти данные никому не передаются. После оплаты'
            ' мы вышли чек на указанный вами номер и почту',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class PriceWidget extends StatelessWidget {
  const PriceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: backgroundtheme,
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Тур',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                'Gorod',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Топливный сбор',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                'Gorod',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Сервисный сбор',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                'Gorod',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'К оплате',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                'Gorod',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
