import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../consts/color_palette.dart';
import '../../../models/hotel_reservation_info.dart';
import '../../../service/reservation_service.dart';
import '../widgets/customtextfield.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  HotelReserve? hotresmod;
  var isLoaded = false;
  int tourinst = 2;

  final _fomrKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    hotresmod = await ReservationService().getPosts();
    if (hotresmod != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Бронирование',
          style: TextStyle(color: Colors.black),
        ),
        toolbarHeight: 50,
        backgroundColor: backgroundtheme,
        elevation: 0,
      ),
      backgroundColor: backgroundbgtheme,
      body: Form(
        key: _fomrKey,
        child: ListView(
          children: [
            HotelScreen(rating: hotresmod!.horating, ratingName: hotresmod!.ratingName),
            BookingInfo(
              arrival_address: hotresmod!.arrivalCountry,
              hotelname: 'Steigenberger Makadi',
              nights_num: hotresmod!.numberOfNights,
              departure: hotresmod!.departure,
              tour_date_start: hotresmod!.tourDateStart,
              tour_date_end: hotresmod!.tourDateStop,
              room: hotresmod!.room,
              food: hotresmod!.nutrition,
            ),
            const ClientNumberForm(),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: tourinst,
                itemBuilder: (context, index) {
                  return TouristForm(touristIndex: index);
                }),
            const AddWidget(),
            PriceWidget(
              fuelprice: hotresmod!.fuelCharge,
              serviceprice: hotresmod!.serviceCharge,
              tourprice: hotresmod!.tourPrice,
            ),
        Align(
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
              child: Text('Оплатить'),
              onPressed: () {
                if (_fomrKey.currentState!.validate()) {
                  Fluttertoast.showToast(msg: 'Заказ принят');
                  Navigator.pushNamed(context, '/bsp');
                }
                else {
                  Fluttertoast.showToast(msg: 'Данные необходимо заполнить');
                }
              },
            ),
          ),
        )
          ],
        ),
      ),
    );
  }
}

class HotelScreen extends StatelessWidget {
  const HotelScreen({Key? key, required this.rating, required this.ratingName}) : super(key: key);

  final int rating;
  final String ratingName;

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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        Align(
        alignment: Alignment.centerLeft,
        child: Container(
          width: 150,
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.amber[50],
              borderRadius: BorderRadius.circular(8)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(
                Icons.star,
                size: 20,
                color: Colors.orange,
              ),
              Text(
                rating.toString(),
                style: const TextStyle(color: Colors.orange),
              ),
              Text(
                ratingName.toString(),
                style: const TextStyle(color: Colors.orange),
              ),
            ],
          ),
        )),
          const Text(
            'Steigenberger Makadi',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const Text(
            'Madinat Makadi, Safaga Road, Makadi Bay, Египет',
            style: TextStyle( color: Colors.blue, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

class BookingInfo extends StatelessWidget {
  const BookingInfo({Key? key,
    required this.hotelname,
    required this.departure,
  required this.food,
  required this.nights_num,
  required this.room,
  required this.tour_date_end,
  required this.tour_date_start,
  required this.arrival_address

  }) : super(key: key);

  final String arrival_address;
  final String departure;
  final String tour_date_start;
  final int nights_num;
  final String hotelname;
  final String room;
  final String food;
  final String tour_date_end;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: backgroundtheme),
      width: double.infinity,
      height: 250,
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Вылет из',
                style: TextStyle(fontSize: 16, color: servicecol),
              ),
              Text(
                departure,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Страна, город',
                style: TextStyle(fontSize: 16, color: servicecol),
              ),
              Text(
                arrival_address,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Даты',
                style: TextStyle(fontSize: 16, color: servicecol),
              ),
              Text(
                '$tour_date_start - $tour_date_end',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Кол-во ночей',
                style: TextStyle(fontSize: 16, color: servicecol),
              ),
              Text(
                '${nights_num.toString()} ночей',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Отель',
                style: TextStyle(fontSize: 16, color: servicecol),
              ),
              Text(
                hotelname,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Номер',
                style: TextStyle(fontSize: 16, color: servicecol),
              ),
              Text(
                room,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Питание',
                style: TextStyle(fontSize: 16, color: servicecol),
              ),
              Text(
                food,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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


  final TextEditingController _phonecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();

  String phoneValue = '';
  String emailValue = '';

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
          CustomTextField(textfield: 'Номер телефона', controller: _phonecontroller, newValue: phoneValue),
          CustomTextField(textfield: 'Почта', controller: _emailcontroller, newValue: emailValue,),
          const Text(
            'Эти данные никому не передаются. После оплаты'
            ' мы вышли чек на указанный вами номер и почту',
            style: TextStyle(fontSize: 16, color: servicecol),
          ),
        ],
      ),
    );
  }
}

class AddWidget extends StatefulWidget {
  const AddWidget({super.key});

  @override
  State<AddWidget> createState() => _AddWidgetState();
}

class _AddWidgetState extends State<AddWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Добавить туриста', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
          GestureDetector(
            onTap: () {

            },
            child: Container(
              decoration: BoxDecoration(
                  color: buttoncol,
                  borderRadius: BorderRadius.circular(8)
              ),
              height: 40,
              width: 40,
              child: const Icon(Icons.add, color: Colors.white, size: 30,),
            ),
          )
        ],
      ),
    );
  }
}


class PriceWidget extends StatelessWidget {
  const PriceWidget({Key? key,
    required this.fuelprice,
    required this.serviceprice,
    required this.tourprice
  }) : super(key: key);

  final int fuelprice;
  final int tourprice;
  final int serviceprice;

  @override
  Widget build(BuildContext context) {
    int totalprice = fuelprice + tourprice + serviceprice;
    return Container(
      height: 160,
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: backgroundtheme,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Тур',
                style: TextStyle(fontSize: 16, color: servicecol),
              ),
              Text(
                tourprice.toString(),
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Топливный сбор',
                style: TextStyle(fontSize: 16, color: servicecol),
              ),
              Text(
                fuelprice.toString(),
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Сервисный сбор',
                style: TextStyle(fontSize: 16, color: servicecol),
              ),
              Text(
                serviceprice.toString(),
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'К оплате',
                style: TextStyle(fontSize: 16, color: servicecol),
              ),
              Text(
                totalprice.toString(),
                style: const TextStyle(fontSize: 16, color: buttoncol),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TouristForm extends StatelessWidget {
  TouristForm({Key? key, required this.touristIndex}) : super(key: key);

  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _lastnamecontroller = TextEditingController();
  TextEditingController _birthcontroller = TextEditingController();
  TextEditingController _citizenshipcontroller = TextEditingController();
  TextEditingController _passport = TextEditingController();
  TextEditingController _passportdue = TextEditingController();

  String nameValue = '';
  String lastValue = '';
  String birthValue = '';
  String citizenshipValue = '';
  String passportValue = '';
  String passportdueValue = '';

  int touristIndex;
  List<String> touristnumberlist = [
    'Первый',
    'Второй',
    'Третий',
    'Четвертый',
    'Пятый'
  ];

  List<String> touristinfo = [
    'Имя',
    'Фамилия',
    'Дата Рождения',
    'Гражданство',
    'Номер загранпаспорта',
    'Срок действия загранпаспорта',
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${touristnumberlist[touristIndex]} турист', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                        color: morebuttoncol,
                        borderRadius: BorderRadius.circular(8)
                    ),
                    height: 40,
                    width: 40,
                    child: Icon(Icons.keyboard_arrow_down, color: buttoncol, size: 30,),
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            CustomTextField(textfield: touristinfo[0], controller: _namecontroller, newValue: nameValue,),
            CustomTextField(textfield: touristinfo[1], controller: _lastnamecontroller, newValue: lastValue),
            CustomTextField(textfield: touristinfo[2], controller: _birthcontroller, newValue: birthValue,),
            CustomTextField(textfield: touristinfo[3], controller: _citizenshipcontroller, newValue: citizenshipValue,),
            CustomTextField(textfield: touristinfo[4], controller: _passport, newValue: passportValue),
            CustomTextField(textfield: touristinfo[5], controller: _passportdue, newValue: passportdueValue,),
            const Text('Эти данные никому не передаются. После оплаты'
                ' мы вышли чек на указанный вами номер и почту', style: TextStyle(fontSize: 16, color: Colors.grey),),
          ],
        ),
      ),
    );
  }
}