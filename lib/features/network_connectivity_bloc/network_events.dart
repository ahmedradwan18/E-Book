import 'package:equatable/equatable.dart';

abstract class NetworkEvent extends Equatable {
  const NetworkEvent();

  @override
  List<Object> get props => [];
}

class NetworkStatusChangeEvent extends NetworkEvent {

  final bool isNetworkConnected;

  NetworkStatusChangeEvent(this.isNetworkConnected);

  @override
  List<Object> get props => [isNetworkConnected];
}


