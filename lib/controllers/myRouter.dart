import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import '../screens/IconState.dart';
import '../screens/iconSelection.dart';
import 'package:my_flutter_app/main.dart';

class MyRouter{
  // final LoginState loginState;
  // MyRouter(this.loginState);

  late final router = GoRouter(
    urlPathStrategy: UrlPathStrategy.path,
    routes: [
      GoRoute(
        name:"rootRoute",
        path: "/",
        redirect: (state)=> state.namedLocation("iconState")),

      GoRoute(
        name: "iconState",
        path: '../screens/iconState',
        pageBuilder: (context,state)=>MaterialPage<void>(
          key: state.pageKey,
          child: IconState())),

      GoRoute(
        name: "iconSelection",
        path: '../screen/iconSelection',
        pageBuilder: (context,state)=>MaterialPage(
          key: state.pageKey,
          child: IconSelection()))
    ]);
}