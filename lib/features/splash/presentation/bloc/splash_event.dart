part of 'splash_bloc.dart';

abstract class SplashEvent extends Equatable {
  const SplashEvent();
}

class GetAuth extends SplashEvent {
  const GetAuth();

  @override
  List<Object?> get props => [];
}
