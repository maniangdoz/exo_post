part of 'splash_bloc.dart';

sealed class SplashEvent extends Equatable {
  const SplashEvent();
}

class GetAuth extends SplashEvent {
  const GetAuth();

  @override
  List<Object?> get props => [];
}
