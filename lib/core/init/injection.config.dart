// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:io' as _i11;

import 'package:get_it/get_it.dart' as _i1;
import 'package:image_picker/image_picker.dart' as _i12;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i22;

import '../../core/logic/app_logic.dart' as _i3;
import '../../core/logic/image_logic.dart' as _i27;
import '../../core/modules/app_module.dart' as _i30;
import '../../core/modules/image_module.dart' as _i29;
import '../../core/modules/network_module.dart' as _i28;
import '../../core/services/api_services.dart' as _i26;
import '../../features/auth/data/repository/auth_repo_imp.dart'
    as _i6;
import '../../features/auth/domain/repository/auth_repo.dart' as _i5;
import '../../features/auth/domain/usecases/auth_usecases.dart'
    as _i7;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i4;
import '../../features/detail_post/data/repository/detail_post_repo_imp.dart'
    as _i9;
import '../../features/detail_post/domain/repository/detail_post_repo.dart'
    as _i8;
import '../../features/detail_post/domain/usecases/detail_post_usecases.dart'
    as _i10;
import '../../features/post/data/repository/post_repo_imp.dart'
    as _i14;
import '../../features/post/domain/repository/post_repo.dart'
    as _i13;
import '../../features/post/domain/usecases/post_usecases.dart'
    as _i16;
import '../../features/profil/data/repository/profil_repo_imp.dart'
    as _i18;
import '../../features/profil/domain/repository/profil_repo.dart'
    as _i17;
import '../../features/profil/domain/usecases/profil_usecases.dart'
    as _i15;
import '../../features/register/data/repository/register_repo_imp.dart'
    as _i20;
import '../../features/register/domain/repository/register_repo.dart'
    as _i19;
import '../../features/register/domain/usecases/register_usecases.dart'
    as _i21;
import '../../features/user/data/repository/user_repo_imp.dart'
    as _i24;
import '../../features/user/domain/repository/user_repo.dart'
    as _i23;
import '../../features/user/domain/usecases/user_usecases.dart'
    as _i25;

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
    final imageModule = _$ImageModule();
    final appModule = _$AppModule();
    gh.factory<_i3.AppLogic>(() => _i3.AppLogic());
    gh.factory<_i4.AuthBloc>(() => _i4.AuthBloc());
    gh.factory<_i5.AuthRepo>(() => _i6.AuthRepoImp());
    gh.factory<_i7.AuthUseCases>(() => _i7.AuthUseCases());
    gh.factory<_i8.DetailPostRepo>(() => _i9.DetailPostRepoImp());
    gh.factory<_i10.DetailPostUseCases>(() => _i10.DetailPostUseCases());
    gh.factory<_i11.HttpClient>(() => networkModule.client);
    gh.factory<_i12.ImagePicker>(() => imageModule.initImagePicker());
    gh.factory<_i13.PostRepo>(() => _i14.PostRepoImp());
    gh.factory<_i15.PostUseCases>(() => _i15.PostUseCases());
    gh.factory<_i16.PostUseCases>(() => _i16.PostUseCases());
    gh.factory<_i17.ProfilRepo>(() => _i18.ProfilRepoImp());
    gh.factory<_i19.RegisterRepo>(() => _i20.RegisterRepoImp());
    gh.factory<_i21.RegisterUseCases>(() => _i21.RegisterUseCases());
    await gh.factoryAsync<_i22.SharedPreferences>(
      () => appModule.prefs,
      preResolve: true,
    );
    gh.factory<_i23.UserRepo>(() => _i24.UserRepoImp());
    gh.factory<_i25.UserUseCases>(() => _i25.UserUseCases());
    gh.factory<_i26.ApiServices>(
        () => _i26.ApiServices(client: gh<_i11.HttpClient>()));
    gh.factory<_i27.ImageLogic>(
        () => _i27.ImageLogic(picker: gh<_i12.ImagePicker>()));
    return this;
  }
}

class _$NetworkModule extends _i28.NetworkModule {}

class _$ImageModule extends _i29.ImageModule {}

class _$AppModule extends _i30.AppModule {}
