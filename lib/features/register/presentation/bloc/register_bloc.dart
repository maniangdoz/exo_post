import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:exo_post/common/utils/app_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/constants.dart';
import '../../domain/entities/register_entity.dart';
import '../../domain/usecases/register_usecases.dart';

part 'register_event.dart';
part 'register_state.dart';

@injectable
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCases _useCase;
  final SharedPreferences _prefs;

  RegisterBloc(this._useCase, this._prefs) : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) {});
    on<Signup>(_signup);
  }

  FutureOr<void> _signup(Signup event, Emitter<RegisterState> emit) async {
    try {
      emit(const SignupFinished(status: Status.waiting));
      RegisterEntity registerEntity = await _useCase.signup(
          name: event.name, email: event.email, password: event.password);
      await _prefs.setString(AppUtils.authTokenKey, registerEntity.authToken ?? '');
      emit(const SignupFinished(status: Status.succeded));
    } catch (e) {
      emit(SignupFinished(status: Status.failed, message: e.toString()));
    }
  }
}
