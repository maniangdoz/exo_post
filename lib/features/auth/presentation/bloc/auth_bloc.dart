import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:exo_post/common/constants.dart';
import 'package:exo_post/features/auth/domain/entities/auth_entity.dart';
import 'package:exo_post/features/auth/domain/usecases/auth_usecases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUseCases _useCase;
  final SharedPreferences _prefs;

  AuthBloc(this._useCase, this._prefs) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});
    on<Login>(_login);
  }

  FutureOr<void> _login(Login event, Emitter<AuthState> emit) async {
    try {
      emit(const LoginFinished(status: Status.waiting));
      AuthEntity authEntity = await _useCase.login(
          email: event.email ?? '', password: event.password ?? '');
      await _prefs.setString('authToken', authEntity.authToken ?? '');
      emit(const LoginFinished(status: Status.succeded));
    } catch (e) {
      emit(LoginFinished(status: Status.failed, message: e.toString()));
    }
  }
}
