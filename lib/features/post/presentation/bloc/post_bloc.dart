import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:exo_post/common/constants.dart';
import 'package:exo_post/features/post/domain/entities/post_response_entity.dart';
import 'package:exo_post/features/post/domain/entities/requests/post_request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/post_usecases.dart';

part 'post_event.dart';
part 'post_state.dart';

@injectable
class PostBloc extends Bloc<PostEvent, PostState> {
  final PostUseCases _useCase;

  PostBloc(this._useCase) : super(PostInitial()) {
    on<PostEvent>((event, emit) {});
    on<GetAllPosts>(_getAllPosts);
  }

  FutureOr<void> _getAllPosts(
      GetAllPosts event, Emitter<PostState> emit) async {
    try {
      emit(const GetAllPostsFinished(status: Status.waiting));
      var response = await _useCase.getAllPosts(request: event.request);
      emit(GetAllPostsFinished(status: Status.succeded, postResponseEntity: response));
    } catch (e) {
      emit(GetAllPostsFinished(status: Status.failed, message: e.toString()));
    }
  }
}
