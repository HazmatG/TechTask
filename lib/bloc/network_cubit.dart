import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkCubit extends Cubit<ConnectivityResult> {
  final Connectivity _connectivity;
  late final StreamSubscription _connectivityStream;

  NetworkCubit({required Connectivity connectivity})
      : _connectivity = connectivity, super(ConnectivityResult.none) {
    _connectivityStream = _connectivity.onConnectivityChanged.listen((ConnectivityResult conres) {
      emit(conres);
    });
  }

  @override
  Future<void> close() {
    _connectivityStream.cancel();
    return super.close();
  }
}