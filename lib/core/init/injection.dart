import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;
//reuse instance app enougth to create new
// reduct call api
// good perform
@InjectableInit()
Future<void> configureDependencies() async => getIt.init();
