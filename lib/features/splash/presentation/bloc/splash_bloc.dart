import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:exo_post/features/splash/domain/entities/splash_response_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/constants.dart';
import '../../domain/usecases/splash_usecases.dart';

part 'splash_event.dart';
part 'splash_state.dart';

@injectable
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final SplashUseCases _useCase;
  final SharedPreferences _prefs;

  SplashBloc(this._useCase, this._prefs) : super(SplashInitial()) {
    on<SplashEvent>((event, emit) {});
    on<GetAuth>(_getAuthMe);
  }

  FutureOr<void> _getAuthMe(GetAuth event, Emitter<SplashState> emit) async {
    try {
      print("ttttttttttttttttttttt");
      emit(const SplashFinished(status: Status.waiting));
      SplashResponseEntity result = await _useCase.getUserLogin();
      if (result.errorMessage != null) {
        await _prefs.setString(
            'authorId', result.userEntity?.id.toString() ?? '');
        await _prefs.setString(
            'createdAt', result.userEntity?.createdAt.toString() ?? '');
        await _prefs.setString('name', result.userEntity?.name ?? '');
        await _prefs.setString('email', result.userEntity?.email ?? '');
      }
      emit(const SplashFinished(status: Status.succeded));
    } catch (e) {
      emit(SplashFinished(status: Status.failed, message: e.toString()));
    }
  }
}
