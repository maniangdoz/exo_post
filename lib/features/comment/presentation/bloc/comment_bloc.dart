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
}
