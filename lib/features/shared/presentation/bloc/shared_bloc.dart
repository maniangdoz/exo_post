import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/constants.dart';
import '../../domain/entities/author_entity.dart';
import '../../domain/usecases/shared_usecases.dart';

part 'shared_event.dart';
part 'shared_state.dart';

@injectable
class SharedBloc extends Bloc<SharedEvent, SharedState> {
  final SharedUseCases _useCase;

  SharedBloc(this._useCase) : super(SharedInitial()) {
    on<SharedEvent>((event, emit) {});
    on<GetInfoUser>(_getInfoUser);
  }

  FutureOr<void> _getInfoUser(
      GetInfoUser event, Emitter<SharedState> emit) async {
    try {
      emit(const GetUserFinished(status: Status.waiting));
      var response = await _useCase.getUserId(userId: event.userId);
      emit(GetUserFinished(
          status: Status.succeded, authorResponseEntity: response));
    } catch (e) {
      emit(GetUserFinished(status: Status.failed, message: e.toString()));
    }
  }
}
