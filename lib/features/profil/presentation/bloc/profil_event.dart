part of 'profil_bloc.dart';

sealed class ProfilEvent extends Equatable {
  const ProfilEvent();
}

class GetAllProfilPosts extends ProfilEvent {
  final UserPostRequest _repuest;

  const GetAllProfilPosts({required UserPostRequest repuest})
      : _repuest = repuest;
  UserPostRequest get request => _repuest;

  @override
  List<Object?> get props => [_repuest];
}
