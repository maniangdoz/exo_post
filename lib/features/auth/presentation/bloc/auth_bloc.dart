import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/constants.dart';
import '../../domain/entities/auth_entity.dart';
import '../../domain/usecases/auth_usecases.dart';

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
