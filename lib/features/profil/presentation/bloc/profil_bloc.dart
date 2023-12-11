import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/constants.dart';
import '../../domain/entities/requests/user_post_request.dart';
import '../../domain/entities/user_post_response_entity.dart';
import '../../domain/usecases/profil_usecases.dart';

part 'profil_event.dart';
part 'profil_state.dart';

@injectable
class ProfilBloc extends Bloc<ProfilEvent, ProfilState> {
  final ProfilUseCases _useCase;

  ProfilBloc(this._useCase) : super(ProfilInitial()) {
    on<ProfilEvent>((event, emit) {});
    on<GetAllProfilPosts>(_getAllUserPosts);
  }

  FutureOr<void> _getAllUserPosts(
      GetAllProfilPosts event, Emitter<ProfilState> emit) async {
    try {
      emit(const GetAllUserPostsFinished(status: Status.waiting));
      var response = await _useCase.getAllUserPosts(request: event.request);
      emit(GetAllUserPostsFinished(
          status: Status.succeded, userPostResponseEntity: response));
    } catch (e) {
      emit(GetAllUserPostsFinished(
          status: Status.failed, message: e.toString()));
    }
  }
}
