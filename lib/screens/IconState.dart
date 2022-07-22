import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:my_flutter_app/assets/colors.dart';
import 'package:my_flutter_app/controllers/database/iconDatabaseController.dart';
import 'package:my_flutter_app/controllers/iconStateController.dart';
import 'package:my_flutter_app/locator.dart';
import 'package:my_flutter_app/main.dart';
import 'package:my_flutter_app/models/iconStateModel.dart';

class IconState extends ConsumerWidget{

  List<IconData> iconsList = [Icons.airplanemode_active,Icons.music_note_sharp,Icons.home,Icons.fort_outlined,
  Icons.nights_stay,Icons.ice_skating_rounded];
  
  List<Color> colorsList = [AppColors.blue,AppColors.red,AppColors.green,AppColors.grey
  ,AppColors.pink,AppColors.purple,AppColors.yellow,AppColors.black];

void changeColor(int color, WidgetRef ref)=> locator<IconStateController>().changeColor(color, ref);
void changeIcon(int icon,WidgetRef ref)=>locator<IconStateController>().changeIcon(icon, ref);


  @override
  Widget build(BuildContext context, WidgetRef ref){

    final IconStateModel iconStateModel = ref.watch(locator<IconStateController>().iconStateProvider);
    IconData icon = iconsList[iconStateModel.icon];
    locator<IconDatabaseController>().init(ref);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 300,
            child: Icon(icon,
            color: colorsList[iconStateModel.color],
            size: (40+iconStateModel.size),),
          ),
          Container(
            child:Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(onPressed: ()=>changeColor(0, ref),
                    backgroundColor: AppColors.blue,
                    mini: true,),
                    FloatingActionButton(onPressed: ()=>changeColor(1, ref),
                    backgroundColor: AppColors.red,
                    mini: true,),
                    FloatingActionButton(onPressed: ()=>changeColor(2, ref),
                    backgroundColor: AppColors.green,
                    mini: true,),
                    FloatingActionButton(onPressed: ()=>changeColor(3, ref),
                    backgroundColor: AppColors.grey,
                    mini: true,)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(onPressed: ()=>changeColor(4, ref),
                    backgroundColor: AppColors.pink,
                    mini: true,),
                    FloatingActionButton(onPressed: ()=>changeColor(5, ref),
                    backgroundColor: AppColors.purple,
                    mini: true,),
                    FloatingActionButton(onPressed: ()=>changeColor(6, ref),
                    backgroundColor: AppColors.yellow,
                    mini: true,),
                    FloatingActionButton(onPressed: ()=>changeColor(7, ref),
                    backgroundColor: AppColors.black,
                    mini: true,)
                  ],
                ),
                Slider(value: iconStateModel.size,
                min: 0,
                max: 100,
                onChanged: (value)=>{
                  locator<IconStateController>().changeSize(value, ref)
                },
                activeColor: AppColors.black,
                inactiveColor: AppColors.grey,
                thumbColor: AppColors.black,),


                Container(
                  padding: EdgeInsets.all(30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FloatingActionButton(
                        backgroundColor: Color(0xffffffff),
                        child: Icon(Icons.airplanemode_active,
                        color:(icon==Icons.airplanemode_active)?AppColors.black:AppColors.grey,size: 25,
                        ),
                        mini: true,
                        onPressed:()=>changeIcon(0, ref)
                      ),
                      FloatingActionButton(
                        backgroundColor: Color(0xffffffff),
                        child: Icon(Icons.music_note_sharp,
                        color: (icon==Icons.music_note_sharp)?AppColors.black:AppColors.grey,size: 25,),
                        mini: true,
                        onPressed:()=>changeIcon(1, ref)
                      ),
                      FloatingActionButton(
                        backgroundColor: Color(0xffffffff),
                        child: Icon(Icons.home,
                        color:(icon==Icons.home)?AppColors.black:AppColors.grey,size: 25,),
                        mini: true,
                        onPressed:()=>changeIcon(2, ref)
                      ),
                      FloatingActionButton(
                        backgroundColor: Color(0xffffffff),
                        child: Icon(Icons.fort_outlined,
                        color: (icon==Icons.fort_outlined)?AppColors.black:AppColors.grey,size: 25,),
                        mini: true,
                        onPressed:()=>changeIcon(3, ref)
                      ),
                      FloatingActionButton(
                        backgroundColor: Color(0xffffffff),
                        child: Icon(Icons.nights_stay,
                        color: (icon==Icons.nights_stay)?AppColors.black:AppColors.grey,size: 25,),
                        mini: true,
                        onPressed:()=>changeIcon(4, ref)
                      ),
                      FloatingActionButton(
                        backgroundColor: Color(0xffffffff),
                        child:Icon(Icons.ice_skating_rounded,
                        color: (icon==Icons.ice_skating_rounded)?AppColors.black:AppColors.grey,
                        size: 25,),
                        mini: true,
                        onPressed:()=>changeIcon(5, ref)
                      ),
                      
                      
                      
                      
                    ],
                  ),
                )
              ],
            )
          )
        ],
      ),
    );
  }
}