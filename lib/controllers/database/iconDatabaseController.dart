import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_flutter_app/controllers/iconStateController.dart';
import 'package:my_flutter_app/locator.dart';
import 'package:path_provider/path_provider.dart';

import '../../models/iconStateModel.dart';

class IconDatabaseController{

  void init(WidgetRef ref) async{
    await Hive.initFlutter();
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    Hive.registerAdapter(IconStateModelAdapter());
    Box box = await Hive.openBox<IconStateModel>("iconState");
    
    if(box.get("icon")== null){
      // print("boxis absent");
      box.put("icon",IconStateModel(icon: 0, color: 0, size: 0.0));
    }else{
      // print("boxis present ${box.get("icon").color.toString()}");
      int icon = box.get("icon").icon;
      int color = box.get("icon").color;
      double size = box.get("icon").size;
      locator<IconStateController>().changeAll(icon, color, size, ref);
    }
    
    // final iconStateModel = ref.watch(locator<IconStateController>().iconStateProvider);
    // box.put("icon",iconStateModel);


  }

  void updateDb(IconStateModel newModel)async{
    Box box = await Hive.openBox<IconStateModel>("iconState");
    box.clear();
    box.put("icon",newModel);
  }
}