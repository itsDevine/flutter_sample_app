
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_flutter_app/assets/colors.dart';
import 'package:my_flutter_app/controllers/myRouter.dart';
import 'package:my_flutter_app/locator.dart';
import 'package:my_flutter_app/screens/IconState.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:provider/provider.dart' as Widget;
import 'package:provider/provider.dart';
import 'controllers/providers/iconStateProvider.dart';
import 'models/iconStateModel.dart';
import 'controllers/myRouter.dart';

final iconStateProvider = StateNotifierProvider<IconStateProvider,IconStateModel>((ref)=>IconStateProvider());
void main () async{
    initLocator();
    runApp(ProviderScope(child: MyApp()));
  }

class MyApp extends StatelessWidget{
  MyApp({super.key});

  @override
  Widget build(BuildContext context){
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: IconState(),
    // );
    return Provider(create: (_)=>MyRouter(),child: Builder(
      builder: (BuildContext context) {
        final router = Provider.of<MyRouter>(context, listen: false).router;
        return MaterialApp.router(
          routeInformationParser: router.routeInformationParser,
          routerDelegate: router.routerDelegate,
          debugShowCheckedModeBanner: false,
          title: 'Navigation App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
        );
      },
    ));
  }

}