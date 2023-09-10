import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hotelapp/model/hotel_onfo.dart';
// import 'package:hotelapp/models/hotel_screen.dart';
import 'package:hotelapp/service/api_service.dart';
import 'package:hotelapp/service/remote_service.dart';
import '../../../consts/color_palette.dart';
import '../../../models/hotel_screen.dart';

class HotelPage extends StatefulWidget {
  const HotelPage({Key? key}) : super(key: key);

  @override
  State<HotelPage> createState() => _HotelPageState();
}

class _HotelPageState extends State<HotelPage> {
  HotelMode? hotmod;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    hotmod = await RemoteService().getPosts();
    if (hotmod != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red,
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
          child: HotelScreen(
            image: hotmod!.imageUrls[0],
              hotelname: hotmod!.name,
              price: hotmod!.minimalPrice,
              country: hotmod!.adress,
              rating: hotmod!.rating,
              ratingName: hotmod!.ratingName),
        ));
  }
}
// FutureBuilder _body() {
//   final apiService =
//       ApiService(Dio(BaseOptions(contentType: "application/json")));
//   return FutureBuilder(
//     future: apiService.getHotels(),
//     builder: (context, snapshots) {
//       if (snapshots.connectionState == ConnectionState.done) {
//         if (snapshots.hasData) {
//           final List<HotelModel> hotels = snapshots.data!;
//           return _hotels(hotels);
//         } else {
//           return const Center(
//             child: Text(
//                 "Error has occurred"),
//           );
//         }
//       } else {
//         return const Center(
//           child: CircularProgressIndicator(),
//         );
//       }
//     },
//   );
// }

//   Widget _hotels(List<HotelModel> hotels) {
//     return ListView.builder(
//         itemCount: hotels.length,
//         itemBuilder: (context, index) {
//           return Stack(children: [
//             ListView(
//               children: [
//                 HotelScreen(
//                   hotelname: hotels[index].name,
//                   price: hotels[index].minimalPrice,
//                   rating: hotels[index].rating,
//                   ratingName: hotels[index].ratingName,
//                   country: hotels[index].adress,
//                 ),
//                 const HotelDescription(),
//               ],
//             ),
//             const BottomButtonWidget()
//           ]);
//         });
//   }
// }

class HotelScreen extends StatelessWidget {
  const HotelScreen(
      {Key? key,
      required this.hotelname,
      required this.price,
      required this.rating,
      required this.ratingName,
        required this.image,
      required this.country})
      : super(key: key);

  final String hotelname;
  final String ratingName;
  final int price;
  final int rating;
  final String country;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: const BoxDecoration(
          color: backgroundtheme,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16))),
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(height: 250, width: double.infinity, decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(image)
            ),
              borderRadius: BorderRadius.circular(16)
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
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
          Text(
            hotelname,
            style: const TextStyle(fontSize: 32),
          ),
          Text(
            country,
            style: TextStyle(fontSize: 18, color: Colors.blue),
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'от ${price.toString()} ₽',
                style:
                    const TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
              ),
              const Text('за тур с переводом',
                  style: TextStyle(fontSize: 20, color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}

class HotelDescription extends StatelessWidget {
  const HotelDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: backgroundtheme, borderRadius: BorderRadius.circular(15)),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'About',
            style: TextStyle(fontSize: 26),
          ),
          const Text(
            'Lorem ipsum dolor sit amet, consectetur disciplining elit, sed do eiusmod tempor incididunt'
            ' ut labore et dolore magna aliqua.',
            style: TextStyle(fontSize: 18),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            // child: ListView.separated(
            //   shrinkWrap: true,
            //   itemCount: 3,
            //   itemBuilder: (BuildContext context, int index) {
            //     return ListTile(
            //       dense: true,
            //       leading: const Icon(Icons.star),
            //       title: Text("Title: $index"),
            //       subtitle: Text("Subtitle: $index"),
            //       trailing: const Icon(Icons.arrow_forward_ios),
            //       onTap: () {},
            //     );
            //   },
            //   separatorBuilder: (BuildContext context, int index) {
            //     return const Divider(height: 1, thickness: 1);
            //   },
            // ),
            decoration: BoxDecoration(
                color: Colors.grey[200],
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
          child: const Text('Choose room'),
          onPressed: () {
            Navigator.pushNamed(context, '/np');
          },
        ),
      ),
    );
  }
}
