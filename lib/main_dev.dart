import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'common/router.dart';
import 'common/styles/theme.dart';
import 'core/init/injection.dart';
import 'core/logic/app_logic.dart';
import 'core/logic/image_logic.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/comment/presentation/bloc/comment_bloc.dart';
import 'features/post/presentation/bloc/post_bloc.dart';
import 'features/register/presentation/bloc/register_bloc.dart';
import 'features/splash/presentation/bloc/splash_bloc.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await configureDependencies();
    await appLogic.bootstrap(env: 'dev');
    runApp(const MyApp());
  }, (error, stack) {});
}

AppLogic get appLogic => getIt.get<AppLogic>();
ImageLogic get imageLogic => getIt.get<ImageLogic>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashBloc>(create: (context) => getIt<SplashBloc>()),
        BlocProvider<AuthBloc>(create: (context) => getIt<AuthBloc>()),
        BlocProvider<RegisterBloc>(create: (context) => getIt<RegisterBloc>()),
        BlocProvider<PostBloc>(create: (context) => getIt<PostBloc>()),
        BlocProvider<CommentBloc>(create: (context) => getIt<CommentBloc>()),
      ],
      child: MaterialApp.router(
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
