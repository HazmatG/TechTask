import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hotelapp/bloc/network_cubit.dart';
import 'package:hotelapp/presentation/ui/pages/hotelpage.dart';
import 'config/routes.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NetworkCubit>(
      create: (context) => NetworkCubit(connectivity: Connectivity()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        onGenerateRoute: RoutesGen.routepack,
        home: BlocListener<NetworkCubit, ConnectivityResult>(
          listener: (context, state) {
            if (state == ConnectivityResult.none) {
              Fluttertoast.showToast(msg: 'Интернет соединение потеряно');
            }
          },
          child: const HotelPage(),
        )
      ),
    );
  }
}
