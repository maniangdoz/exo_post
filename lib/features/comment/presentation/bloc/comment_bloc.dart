import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/constants.dart';
import '../../domain/entities/comment_response_entity.dart';
import '../../domain/usecases/comment_usecases.dart';

part 'comment_event.dart';
part 'comment_state.dart';

@injectable
class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final CommentUseCases _useCase;

  CommentBloc(this._useCase) : super(CommentInitial()) {
    on<CommentEvent>((event, emit) {});
    on<GetAllCommentByPost>(_getAllComments);
    on<AddComment>(_addComment);
    on<UpdateComment>(_addUpdateComment);
    on<RemoveComments>(_removeComment);
  }

  FutureOr<void> _getAllComments(
      GetAllCommentByPost event, Emitter<CommentState> emit) async {
    try {
      emit(const GetAllCommentsFinished(status: Status.waiting));
      var response = await _useCase.getCommentsPost(postId: event.postId);
      emit(GetAllCommentsFinished(
          status: Status.succeded, commentResponseEntity: response));
    } catch (e) {
      emit(
          GetAllCommentsFinished(status: Status.failed, message: e.toString()));
    }
  }

  FutureOr<void> _addComment(
      AddComment event, Emitter<CommentState> emit) async {
    try {
      emit(const AddCommentFinished(status: Status.waiting));
      var result = await _useCase.addComment(
          content: event.content ?? '', postId: event.postId);
      if (result.errorMessage != null) {
        emit(AddCommentFinished(
            status: Status.failed, message: result.errorMessage));
      } else {
        emit(const AddCommentFinished(status: Status.succeded));
      }
    } catch (e) {
      emit(AddCommentFinished(status: Status.failed, message: e.toString()));
    }
  }

  FutureOr<void> _addUpdateComment(
      UpdateComment event, Emitter<CommentState> emit) async {
    try {
      emit(const UpdateCommentFinished(status: Status.waiting));
      var result = await _useCase.updateComment(
          content: event.content ?? '', commentId: event.commentId);
      if (result.errorMessage != null) {
        emit(UpdateCommentFinished(
            status: Status.failed, message: result.errorMessage));
      } else {
        emit(const UpdateCommentFinished(status: Status.succeded));
      }
    } catch (e) {
      emit(UpdateCommentFinished(status: Status.failed, message: e.toString()));
    }
  }

  FutureOr<void> _removeComment(
      RemoveComments event, Emitter<CommentState> emit) async {
    try {
      emit(const RemoveCommentsFinished(status: Status.waiting));
      var response = await _useCase.removeComment(commentId: event.commentId);
      emit(RemoveCommentsFinished(status: Status.succeded, message: response));
    } catch (e) {
      emit(
          RemoveCommentsFinished(status: Status.failed, message: e.toString()));
    }
  }
}
