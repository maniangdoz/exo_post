// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:io' as _i8;

import 'package:exo_post/core/logic/app_logic.dart' as _i3;
import 'package:exo_post/core/modules/app_module.dart' as _i12;
import 'package:exo_post/core/modules/network_module.dart' as _i11;
import 'package:exo_post/core/services/api_services.dart' as _i10;
import 'package:exo_post/features/auth/data/repository/auth_repo_imp.dart'
    as _i6;
import 'package:exo_post/features/auth/domain/repository/auth_repo.dart' as _i5;
import 'package:exo_post/features/auth/domain/usecases/auth_usecases.dart'
    as _i7;
import 'package:exo_post/features/auth/presentation/bloc/auth_bloc.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i9;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    final appModule = _$AppModule();
    gh.factory<_i3.AppLogic>(() => _i3.AppLogic());
    gh.factory<_i4.AuthBloc>(() => _i4.AuthBloc());
    gh.factory<_i5.AuthRepo>(() => _i6.AuthRepoImp());
    gh.factory<_i7.AuthUseCases>(() => _i7.AuthUseCases());
    gh.factory<_i8.HttpClient>(() => networkModule.client);
    await gh.factoryAsync<_i9.SharedPreferences>(
      () => appModule.prefs,
      preResolve: true,
    );
    gh.factory<_i10.ApiServices>(
        () => _i10.ApiServices(client: gh<_i8.HttpClient>()));
    return this;
  }
}

class _$NetworkModule extends _i11.NetworkModule {}

class _$AppModule extends _i12.AppModule {}
