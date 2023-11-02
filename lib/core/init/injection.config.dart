// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:exo_post/core/logic/app_logic.dart' as _i3;
import 'package:exo_post/core/logic/image_logic.dart' as _i23;
import 'package:exo_post/core/modules/app_module.dart' as _i31;
import 'package:exo_post/core/modules/image_module.dart' as _i30;
import 'package:exo_post/core/modules/network_module.dart' as _i29;
import 'package:exo_post/core/services/api_services.dart' as _i19;
import 'package:exo_post/features/auth/data/repository/auth_repo_imp.dart'
    as _i21;
import 'package:exo_post/features/auth/domain/repository/auth_repo.dart'
    as _i20;
import 'package:exo_post/features/auth/domain/usecases/auth_usecases.dart'
    as _i22;
import 'package:exo_post/features/auth/presentation/bloc/auth_bloc.dart'
    as _i27;
import 'package:exo_post/features/comment/data/repository/comment_repo_imp.dart'
    as _i5;
import 'package:exo_post/features/comment/domain/repository/comment_repo.dart'
    as _i4;
import 'package:exo_post/features/comment/domain/usecases/comment_usecases.dart'
    as _i6;
import 'package:exo_post/features/post/data/repository/post_repo_imp.dart'
    as _i10;
import 'package:exo_post/features/post/domain/repository/post_repo.dart' as _i9;
import 'package:exo_post/features/post/domain/usecases/post_usecases.dart'
    as _i12;
import 'package:exo_post/features/profil/data/repository/profil_repo_imp.dart'
    as _i14;
import 'package:exo_post/features/profil/domain/repository/profil_repo.dart'
    as _i13;
import 'package:exo_post/features/profil/domain/usecases/profil_usecases.dart'
    as _i11;
import 'package:exo_post/features/register/data/repository/register_repo_imp.dart'
    as _i25;
import 'package:exo_post/features/register/domain/repository/register_repo.dart'
    as _i24;
import 'package:exo_post/features/register/domain/usecases/register_usecases.dart'
    as _i26;
import 'package:exo_post/features/register/presentation/bloc/register_bloc.dart'
    as _i28;
import 'package:exo_post/features/user/data/repository/user_repo_imp.dart'
    as _i17;
import 'package:exo_post/features/user/domain/repository/user_repo.dart'
    as _i16;
import 'package:exo_post/features/user/domain/usecases/user_usecases.dart'
    as _i18;
import 'package:get_it/get_it.dart' as _i1;
import 'package:image_picker/image_picker.dart' as _i8;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pretty_http_logger/pretty_http_logger.dart' as _i7;
import 'package:shared_preferences/shared_preferences.dart' as _i15;

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
    gh.factory<_i4.CommentRepo>(() => _i5.CommentRepoImp());
    gh.factory<_i6.CommentUseCases>(() => _i6.CommentUseCases());
    gh.factory<_i7.HttpWithMiddleware>(() => networkModule.client);
    gh.factory<_i8.ImagePicker>(() => imageModule.initImagePicker());
    gh.factory<_i9.PostRepo>(() => _i10.PostRepoImp());
    gh.factory<_i11.PostUseCases>(() => _i11.PostUseCases());
    gh.factory<_i12.PostUseCases>(() => _i12.PostUseCases());
    gh.factory<_i13.ProfilRepo>(() => _i14.ProfilRepoImp());
    await gh.factoryAsync<_i15.SharedPreferences>(
      () => appModule.prefs,
      preResolve: true,
    );
    gh.factory<_i16.UserRepo>(() => _i17.UserRepoImp());
    gh.factory<_i18.UserUseCases>(() => _i18.UserUseCases());
    gh.factory<_i19.ApiServices>(
        () => _i19.ApiServices(client: gh<_i7.HttpWithMiddleware>()));
    gh.factory<_i20.AuthRepo>(
        () => _i21.AuthRepoImp(api: gh<_i19.ApiServices>()));
    gh.factory<_i22.AuthUseCases>(
        () => _i22.AuthUseCases(repo: gh<_i20.AuthRepo>()));
    gh.factory<_i23.ImageLogic>(
        () => _i23.ImageLogic(picker: gh<_i8.ImagePicker>()));
    gh.factory<_i24.RegisterRepo>(
        () => _i25.RegisterRepoImp(api: gh<_i19.ApiServices>()));
    gh.factory<_i26.RegisterUseCases>(
        () => _i26.RegisterUseCases(repo: gh<_i24.RegisterRepo>()));
    gh.factory<_i27.AuthBloc>(() => _i27.AuthBloc(
          gh<_i22.AuthUseCases>(),
          gh<_i15.SharedPreferences>(),
        ));
    gh.factory<_i28.RegisterBloc>(() => _i28.RegisterBloc(
          gh<_i26.RegisterUseCases>(),
          gh<_i15.SharedPreferences>(),
        ));
    return this;
  }
}

class _$NetworkModule extends _i29.NetworkModule {}

class _$ImageModule extends _i30.ImageModule {}

class _$AppModule extends _i31.AppModule {}
