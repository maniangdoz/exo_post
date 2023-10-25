import 'dart:async';
import 'package:flutter/material.dart';

import 'common/router.dart';
import 'common/styles/theme.dart';
import 'core/init/injection.dart';
import 'core/logic/app_logic.dart';
import 'core/logic/image_logic.dart';

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
    return MaterialApp.router(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
