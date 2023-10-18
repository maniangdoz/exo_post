import 'dart:async';

import 'package:exo_post/common/constants.dart';
import 'package:exo_post/common/router.dart';
import 'package:exo_post/common/styles/theme.dart';
import 'package:exo_post/core/init/injection.dart';
import 'package:exo_post/features/splash/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';

import 'core/logic/app_logic.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await configureDependencies();
    await appLogic.bootstrap(env: 'prod');
    runApp(const MyApp());
  }, (error, stack) {});
}

AppLogic get appLogic => getIt.get<AppLogic>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: AppConstants.isDarkMode(context)
            ? AppTheme.darkTheme
            : AppTheme.lightTheme,
        home: MaterialApp.router(
          routerConfig: appRouter,
        ));
  }
}
