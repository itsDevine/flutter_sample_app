import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_flutter_app/assets/colors.dart';
import 'package:my_flutter_app/controllers/database/iconDatabaseController.dart';
import 'package:my_flutter_app/locator.dart';
import 'package:my_flutter_app/models/iconStateModel.dart';

class IconStateProvider extends StateNotifier<IconStateModel>{
  IconStateProvider():super(IconStateModel(icon:0,color:0,size: 0.0));


  void changeColor(int color){
    state =  state.copyWith(color: color);
    locator<IconDatabaseController>().updateDb(state);
  }

  void changeIcon(int icon){
    state = state.copyWith(icon: icon);
    locator<IconDatabaseController>().updateDb(state);
  }

  void changeSize(double size){
    state = state.copyWith(size: size);
    locator<IconDatabaseController>().updateDb(state);
  }

  void changeAll(int icon, int color, double size){
    state = state.copyWith(icon:icon,color:color,size:size);
    locator<IconDatabaseController>().updateDb(state);
  }
}