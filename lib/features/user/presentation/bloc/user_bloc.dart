import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:exo_post/features/user/domain/usecases/user_usecases.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/constants.dart';
import '../../domain/entities/user_post_response_entity.dart';

part 'user_event.dart';
part 'user_state.dart';

@injectable
class UserBloc extends Bloc<UserEvent, UserState> {
  final UserUseCases _useCases;

  UserBloc(this._useCases) : super(UserInitial()) {
    on<UserEvent>((event, emit) {});
    on<GetAllUserPosts>(_getAllPosts);
  }

  FutureOr<void> _getAllPosts(
      GetAllUserPosts event, Emitter<UserState> emit) async {
    try {
      emit(GetAllPostState(status: Status.waiting));
      var response = await _useCases.getAllPosts(
          userId: event.userId, page: event.page, perPage: event.perPage);
      emit(GetAllPostState(
          status: Status.succeded, userPostResponseEntity: response));
    } catch (e) {
      emit(GetAllPostState(status: Status.failed, message: '$e'));
    }
  }
}
