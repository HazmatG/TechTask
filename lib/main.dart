import 'package:flutter/material.dart';
import 'package:hotelapp/presentation/ui/pages/bookingpage.dart';

import 'config/routes.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: RoutesGen.routepack,
    );
  }
}
