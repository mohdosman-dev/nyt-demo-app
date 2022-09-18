import 'package:equatable/equatable.dart';

abstract class IFailure extends Equatable {}

//! Client side failure (Offline)
class OfflineFailure extends IFailure {
  @override
  List<Object?> get props => [];
}

//! Server side failure
class ServerFailure extends IFailure {
  @override
  List<Object?> get props => [];
}
