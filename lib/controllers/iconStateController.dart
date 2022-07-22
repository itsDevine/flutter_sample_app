import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import '../models/iconStateModel.dart';
import 'providers/iconStateProvider.dart';

class IconStateController{

  final iconStateProvider = StateNotifierProvider<IconStateProvider,IconStateModel>((ref)=>IconStateProvider());
 
  void changeIcon(int icon,WidgetRef ref){
    ref.read(iconStateProvider.notifier).changeIcon(icon);
  }

  void changeColor(int color,WidgetRef ref){
    ref.read(iconStateProvider.notifier).changeColor(color);
  }

  void changeSize(double size,WidgetRef ref){
    ref.read(iconStateProvider.notifier).changeSize(size);
  }

  void changeAll(int icon, int color, double size, WidgetRef ref){
    ref.read(iconStateProvider.notifier).changeAll(icon, color, size);
  }

}