part of 'splash_bloc.dart';

abstract class SplashState extends Equatable {
  const SplashState();
}

class SplashInitial extends SplashState {
  @override
  List<Object> get props => [];
}
class SplashFinished extends SplashState {
  final Status? status;
  final String? message;

  const SplashFinished({this.status, this.message});

  @override
  List<Object?> get props => [status, message];
}
