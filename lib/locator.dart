

import 'package:get_it/get_it.dart';
import 'package:my_flutter_app/controllers/database/iconDatabaseController.dart';
import 'package:my_flutter_app/controllers/iconStateController.dart';
import 'package:my_flutter_app/controllers/providers/iconStateProvider.dart';

GetIt locator = GetIt.instance;

void initLocator(){
  locator.registerSingleton<IconStateController>(IconStateController());
  locator.registerSingleton<IconDatabaseController>(IconDatabaseController());
}