part of 'profil_bloc.dart';

sealed class ProfilState extends Equatable {
  const ProfilState();
  
  @override
  List<Object> get props => [];
}

final class ProfilInitial extends ProfilState {}
