import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'network_events.dart';
import 'network_states.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkStates> {
 bool isNetworkConnected;
  NetworkBloc(this.isNetworkConnected)
      : super(const NetworkStates(isConnected: true)) {
    on<NetworkStatusChangeEvent>(_networkStatusChange);
  }

  FutureOr<void> _networkStatusChange(
      NetworkStatusChangeEvent event, Emitter<NetworkStates> emit) async {
    isNetworkConnected=event.isNetworkConnected;
    emit(state.copyWith(isConnected: event.isNetworkConnected));
  }
}
