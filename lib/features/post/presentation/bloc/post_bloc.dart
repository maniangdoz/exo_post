import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/constants.dart';
import '../../domain/entities/post_response_entity.dart';
import '../../domain/entities/requests/post_request.dart';
import '../../domain/usecases/post_usecases.dart';

part 'post_event.dart';
part 'post_state.dart';

@injectable
class PostBloc extends Bloc<PostEvent, PostState> {
  final PostUseCases _useCase;

  PostBloc(this._useCase) : super(PostInitial()) {
    on<PostEvent>((event, emit) {});
    on<GetAllPosts>(_getAllPosts);
    on<AddPost>(_addPost);
  }

  FutureOr<void> _getAllPosts(
      GetAllPosts event, Emitter<PostState> emit) async {
    try {
      emit(const GetAllPostsFinished(status: Status.waiting));
      var response = await _useCase.getAllPosts(request: event.request);
      emit(GetAllPostsFinished(
          status: Status.succeded, postResponseEntity: response));
    } catch (e) {
      emit(GetAllPostsFinished(status: Status.failed, message: e.toString()));
    }
  }

  FutureOr<void> _addPost(AddPost event, Emitter<PostState> emit) async {
    try {
      emit(const AddPostFinished(status: Status.waiting));
      var result = await _useCase.addPost(
          content: event.content ?? '', base64Image: event.base64Image);
      print(
          "result.errorMessageresult.errorMessage ${result.errorMessage} eeeeeeee ${result.errorMessage != null}");
      if (result.errorMessage != null) {
        emit(AddPostFinished(
            status: Status.failed, message: result.errorMessage));
      } else {
        emit(const AddPostFinished(status: Status.succeded));
      }
    } catch (e) {
      print("e.toString()e.toString()e.toString()e.toString()  $e");
      emit(AddPostFinished(status: Status.failed, message: e.toString()));
    }
  }
}
