import 'dart:async';

import 'package:flutter/material.dart';

import 'common/router.dart';
import 'common/styles/theme.dart';
import 'core/init/injection.dart';
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
    return MaterialApp.router(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routerConfig: appRouter,
    );
  }
}
