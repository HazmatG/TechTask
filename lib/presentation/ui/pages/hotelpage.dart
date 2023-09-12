import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hotelapp/presentation/ui/widgets/imageSlider.dart';
import 'package:hotelapp/presentation/ui/widgets/peculiaritywid.dart';
import 'package:hotelapp/service/hotel_service.dart';
import '../../../consts/color_palette.dart';
import '../../../models/hotel_info.dart';

class HotelPage extends StatefulWidget {
  const HotelPage({Key? key}) : super(key: key);

  @override
  State<HotelPage> createState() => _HotelPageState();
}

class _HotelPageState extends State<HotelPage> {
  HotelMode? hotmod;                              // object of class
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future getData() async {
    hotmod = await HotelService().getHotelInfo();
    if (hotmod != null) {                            // checks if it has data
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundbgtheme,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Отель',
            style: TextStyle(color: Colors.black),
          ),
          toolbarHeight: 50,
          backgroundColor: backgroundtheme,
          elevation: 0,
        ),
        body: Visibility(
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
          visible: isLoaded,
          child: ListView(
            children: [ HotelScreen(
              image: hotmod!.imageUrls,
                hotelname: hotmod!.name,
                price: hotmod!.minimalPrice,
                priceForIt: hotmod!.priceForIt,
                country: hotmod!.adress,
                rating: hotmod!.rating,
                ratingName: hotmod!.ratingName),
              HotelDescription(hotdesc: hotmod!.aboutTheHotel.description, peculiarities: hotmod!.aboutTheHotel.peculiarities, pecnum: hotmod!.aboutTheHotel.peculiarities.length),
              const BottomButtonWidget()
              ]
          ),
        )
    );
  }
}

class HotelScreen extends StatelessWidget {
  const HotelScreen(
      {Key? key,
      required this.hotelname,
      required this.price,
      required this.priceForIt,
      required this.rating,
      required this.ratingName,
        required this.image,
      required this.country})
      : super(key: key);

  final String hotelname;
  final String ratingName;
  final int price;
  final String priceForIt;
  final int rating;
  final String country;
  final List<String> image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: const BoxDecoration(
          color: backgroundtheme,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16))),
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageSlider(image: image),
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
            ),
          ),
          const Text(
            'Steigenberger Makadi',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
          ),
          Text(
            country,
            style: const TextStyle(fontSize: 16, color: Colors.blue, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'от ${price.toString()} ₽',
                style:
                    const TextStyle(fontSize: 28, fontWeight: FontWeight.w500, fontFamily: 'SFPro'),
              ),
              Text(priceForIt.toString(),
                  style: const TextStyle(fontSize: 18, color: servicecol)),
            ],
          ),
        ],
      ),
    );
  }
}

class HotelDescription extends StatelessWidget {
  HotelDescription({Key? key, required this.hotdesc, required this.peculiarities, required this.pecnum}) : super(key: key);

  final String hotdesc;
  final List<String> peculiarities;
  final int pecnum;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: backgroundtheme, borderRadius: BorderRadius.circular(15)),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Об отеле',
            style: TextStyle(fontSize: 26),
          ),
          Wrap(
            children:
              List.generate(pecnum, (index) {
                return PeculiarityWid(peculiarities: peculiarities, index: index);
              })
          ),
          Text(
            hotdesc,
            style: const TextStyle(fontSize: 18),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: backgroundbgtheme,
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.account_box),
                    Column(
                      children: [
                        const Text(
                          'Удобства',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Самое необходимое',
                          style:
                              TextStyle(fontSize: 18, color: Colors.grey[800]),
                        ),
                      ],
                    ),
                    const Icon(Icons.arrow_forward_ios_rounded),
                  ],
                ),
                const Divider(
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.check_box_outlined),
                    Column(
                      children: [
                        const Text(
                          'Что включено',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Самое необходимое',
                          style:
                              TextStyle(fontSize: 18, color: Colors.grey[800]),
                        ),
                      ],
                    ),
                    const Icon(Icons.arrow_forward_ios_rounded),
                  ],
                ),
                const Divider(
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.indeterminate_check_box_outlined),
                    Column(
                      children: [
                        const Text(
                          'Что не включено',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Самое необходимое',
                          style:
                              TextStyle(fontSize: 18, color: Colors.grey[800]),
                        ),
                      ],
                    ),
                    const Icon(Icons.arrow_forward_ios_rounded),
                  ],
                ),
              ],
            ),
          ),
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
          child: const Text('К выбору номера'),
          onPressed: () {
            Navigator.pushNamed(context, '/np');
          },
        ),
      ),
    );
  }
}
