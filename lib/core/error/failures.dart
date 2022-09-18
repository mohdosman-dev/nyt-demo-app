import 'package:equatable/equatable.dart';

abstract class IFailure extends Equatable {
  late final String? message;
}

//! Client side failure (Offline)
class OfflineFailure extends IFailure {
  final String? offlineMessage;
  OfflineFailure(this.offlineMessage);

  @override
  List<Object?> get props => [];
}

//! Server side failure
class ServerFailure extends IFailure {
  //* Message to describe what's going on
  final String serverMessage;
  
  ServerFailure(this.serverMessage);

  @override
  List<Object?> get props => [];
}
