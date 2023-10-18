import 'dart:async';
import 'package:exo_post/common/constants.dart';
import 'package:exo_post/common/router.dart';
import 'package:exo_post/common/styles/theme.dart';
import 'package:exo_post/core/logic/app_logic.dart';
import 'package:flutter/material.dart';

import 'core/init/injection.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await configureDependencies();
    await appLogic.bootstrap(env: 'dev');
    runApp(const MyApp());
  }, (error, stack) {});
}

AppLogic get appLogic => getIt.get<AppLogic>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo Dev',
      theme: AppConstants.isDarkMode(context)
          ? AppTheme.darkTheme
          : AppTheme.lightTheme,
      routerConfig: appRouter,
    );
  }
}
