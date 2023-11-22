// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:exo_post/core/logic/app_logic.dart' as _i3;
import 'package:exo_post/core/logic/image_logic.dart' as _i18;
import 'package:exo_post/core/modules/app_module.dart' as _i39;
import 'package:exo_post/core/modules/image_module.dart' as _i38;
import 'package:exo_post/core/modules/network_module.dart' as _i37;
import 'package:exo_post/core/services/api_services.dart' as _i11;
import 'package:exo_post/features/auth/data/repository/auth_repo_imp.dart'
    as _i13;
import 'package:exo_post/features/auth/domain/repository/auth_repo.dart'
    as _i12;
import 'package:exo_post/features/auth/domain/usecases/auth_usecases.dart'
    as _i14;
import 'package:exo_post/features/auth/presentation/bloc/auth_bloc.dart'
    as _i31;
import 'package:exo_post/features/comment/data/repository/comment_repo_imp.dart'
    as _i16;
import 'package:exo_post/features/comment/domain/repository/comment_repo.dart'
    as _i15;
import 'package:exo_post/features/comment/domain/usecases/comment_usecases.dart'
    as _i17;
import 'package:exo_post/features/comment/presentation/bloc/comment_bloc.dart'
    as _i32;
import 'package:exo_post/features/post/data/repository/post_repo_imp.dart'
    as _i20;
import 'package:exo_post/features/post/domain/repository/post_repo.dart'
    as _i19;
import 'package:exo_post/features/post/domain/usecases/post_usecases.dart'
    as _i21;
import 'package:exo_post/features/post/presentation/bloc/post_bloc.dart'
    as _i33;
import 'package:exo_post/features/profil/data/repository/profil_repo_imp.dart'
    as _i23;
import 'package:exo_post/features/profil/domain/repository/profil_repo.dart'
    as _i22;
import 'package:exo_post/features/profil/domain/usecases/profil_usecases.dart'
    as _i24;
import 'package:exo_post/features/profil/presentation/bloc/profil_bloc.dart'
    as _i34;
import 'package:exo_post/features/register/data/repository/register_repo_imp.dart'
    as _i26;
import 'package:exo_post/features/register/domain/repository/register_repo.dart'
    as _i25;
import 'package:exo_post/features/register/domain/usecases/register_usecases.dart'
    as _i27;
import 'package:exo_post/features/register/presentation/bloc/register_bloc.dart'
    as _i35;
import 'package:exo_post/features/shared/data/repository/shared_repo_imp.dart'
    as _i29;
import 'package:exo_post/features/shared/domain/repository/shared_repo.dart'
    as _i28;
import 'package:exo_post/features/shared/domain/usecases/shared_usecases.dart'
    as _i30;
import 'package:exo_post/features/shared/presentation/bloc/shared_bloc.dart'
    as _i36;
import 'package:exo_post/features/user/data/repository/user_repo_imp.dart'
    as _i9;
import 'package:exo_post/features/user/domain/repository/user_repo.dart' as _i8;
import 'package:exo_post/features/user/domain/usecases/user_usecases.dart'
    as _i10;
import 'package:exo_post/features/user/presentation/bloc/user_bloc.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:image_picker/image_picker.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pretty_http_logger/pretty_http_logger.dart' as _i4;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

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
    gh.factory<_i4.HttpWithMiddleware>(() => networkModule.client);
    gh.factory<_i5.ImagePicker>(() => imageModule.initImagePicker());
    await gh.factoryAsync<_i6.SharedPreferences>(
      () => appModule.prefs,
      preResolve: true,
    );
    gh.factory<_i7.UserBloc>(() => _i7.UserBloc());
    gh.factory<_i8.UserRepo>(() => _i9.UserRepoImp());
    gh.factory<_i10.UserUseCases>(() => _i10.UserUseCases());
    gh.factory<_i11.ApiServices>(
        () => _i11.ApiServices(client: gh<_i4.HttpWithMiddleware>()));
    gh.factory<_i12.AuthRepo>(
        () => _i13.AuthRepoImp(api: gh<_i11.ApiServices>()));
    gh.factory<_i14.AuthUseCases>(
        () => _i14.AuthUseCases(repo: gh<_i12.AuthRepo>()));
    gh.factory<_i15.CommentRepo>(
        () => _i16.CommentRepoImp(api: gh<_i11.ApiServices>()));
    gh.factory<_i17.CommentUseCases>(
        () => _i17.CommentUseCases(repo: gh<_i15.CommentRepo>()));
    gh.factory<_i18.ImageLogic>(
        () => _i18.ImageLogic(picker: gh<_i5.ImagePicker>()));
    gh.factory<_i19.PostRepo>(
        () => _i20.PostRepoImp(api: gh<_i11.ApiServices>()));
    gh.factory<_i21.PostUseCases>(
        () => _i21.PostUseCases(repo: gh<_i19.PostRepo>()));
    gh.factory<_i22.ProfilRepo>(
        () => _i23.ProfilRepoImp(api: gh<_i11.ApiServices>()));
    gh.factory<_i24.ProfilUseCases>(
        () => _i24.ProfilUseCases(repo: gh<_i22.ProfilRepo>()));
    gh.factory<_i25.RegisterRepo>(
        () => _i26.RegisterRepoImp(api: gh<_i11.ApiServices>()));
    gh.factory<_i27.RegisterUseCases>(
        () => _i27.RegisterUseCases(repo: gh<_i25.RegisterRepo>()));
    gh.factory<_i28.SharedRepo>(
        () => _i29.SharedRepoImp(api: gh<_i11.ApiServices>()));
    gh.factory<_i30.SharedUseCases>(
        () => _i30.SharedUseCases(repo: gh<_i28.SharedRepo>()));
    gh.factory<_i31.AuthBloc>(() => _i31.AuthBloc(
          gh<_i14.AuthUseCases>(),
          gh<_i6.SharedPreferences>(),
        ));
    gh.factory<_i32.CommentBloc>(
        () => _i32.CommentBloc(gh<_i17.CommentUseCases>()));
    gh.factory<_i33.PostBloc>(() => _i33.PostBloc(gh<_i21.PostUseCases>()));
    gh.factory<_i34.ProfilBloc>(
        () => _i34.ProfilBloc(gh<_i24.ProfilUseCases>()));
    gh.factory<_i35.RegisterBloc>(() => _i35.RegisterBloc(
          gh<_i27.RegisterUseCases>(),
          gh<_i6.SharedPreferences>(),
        ));
    gh.factory<_i36.SharedBloc>(
        () => _i36.SharedBloc(gh<_i30.SharedUseCases>()));
    return this;
  }
}

class _$NetworkModule extends _i37.NetworkModule {}

class _$ImageModule extends _i38.ImageModule {}

class _$AppModule extends _i39.AppModule {}
