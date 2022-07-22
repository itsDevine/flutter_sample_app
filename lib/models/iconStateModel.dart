import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../assets/colors.dart';

part 'iconStateModel.g.dart';

@HiveType(typeId: 0)
@immutable
class IconStateModel{

const IconStateModel({required this.icon,required this.color,required this.size});


  @HiveField(0)
  final int icon;
  
  @HiveField(1)
  final int color;
  
  @HiveField(2)
  final double size;

IconStateModel copyWith({int? icon,int? color,double? size}){
  return IconStateModel(icon: icon??this.icon, color: color??this.color, size: size??this.size);
}
}

