part of 'profil_bloc.dart';

sealed class ProfilEvent extends Equatable {
  const ProfilEvent();
}

class GetAllUserPosts extends ProfilEvent {
  final UserPostRequest _repuest;

  const GetAllUserPosts({required UserPostRequest repuest})
      : _repuest = repuest;
  UserPostRequest get request => _repuest;

  @override
  List<Object?> get props => [_repuest];
}
