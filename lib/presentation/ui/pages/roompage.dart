import 'package:flutter/material.dart';
import 'package:hotelapp/presentation/ui/widgets/imageSlider.dart';
import 'package:hotelapp/presentation/ui/widgets/peculiaritywid.dart';
import '../../../consts/color_palette.dart';
import '../../../models/hotel_room_info.dart';
import '../../../service/room_service.dart';
import '../widgets/custom_button_widget.dart';

class HotelNumberPage extends StatefulWidget {
  const HotelNumberPage({Key? key}) : super(key: key);

  @override
  State<HotelNumberPage> createState() => _HotelNumberPageState();
}

class _HotelNumberPageState extends State<HotelNumberPage> {
  HotelRoom? roommod;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    getData();
  }

  getData() async {
    roommod = await RoomService().getRooms();
    if (roommod != null) {
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
            'Steigenberger Makadi',
            style: TextStyle(color: Colors.black),
          ),
          toolbarHeight: 50,
          backgroundColor: backgroundtheme,
          elevation: 0,
        ),
        backgroundColor: Colors.grey[200],
        body: Visibility(
          replacement: const Center(child: CircularProgressIndicator()),
          visible: isLoaded,
          child: ListView(
            children: [
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                  itemCount: roommod!.rooms.length,
                  itemBuilder: (context, index) {
                    return HotelRoomScreen(
                      imageUrl: roommod!.rooms[index].imageUrls,
                      hotelname: roommod!.rooms[index].name,
                      price: roommod!.rooms[index].price,
                      priceForIt: roommod!.rooms[index].pricePer,
                      peculiarities: roommod!.rooms[index].peculiarities,
                    );
                  })
            ],
          ),
        ));
  }
}

class HotelRoomScreen extends StatelessWidget {
  const HotelRoomScreen({
    Key? key,
    required this.hotelname,
    required this.price,
    required this.priceForIt,
    required this.imageUrl,
    required this.peculiarities
  }) : super(key: key);

  final List<String> imageUrl;
  final String hotelname;
  final int price;
  final String priceForIt;
  final List<String> peculiarities;

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
          ImageSlider(image: imageUrl),
          Text(
            hotelname,
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 12),
          Wrap(
            children: List.generate(2, (index) {
              return PeculiarityWid(peculiarities: peculiarities, index: index);
            })
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: morebuttoncol,
              ),
              padding: const EdgeInsets.all(5),
              width: 200,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Подробнее о номере',
                    style: TextStyle(color: buttoncolor),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: buttoncolor,
                  )
                ],
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$price ₽',
                style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              Text(priceForIt,
                  style: const TextStyle(fontSize: 18, color: servicecol)),
            ],
          ),
          BottomButtonWidget(routeParameter: '/rp', buttontitle: 'Выбор номера',)
        ],
      ),
    );
  }
}