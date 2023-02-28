import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants {
  Constants._();

  static const String title = 'Pokedex';
  static TextStyle getTitleTextStyle() {
    return TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: _calculateFontSize(30));
  }

  static TextStyle getPokemonTextStyle() {
    return TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: _calculateFontSize(15));
  }

    static TextStyle getTypeChipStyle() {
    return TextStyle(
        color: Colors.white, fontSize: _calculateFontSize(12));
  }

  static getPokeInfoLabelTextStyle() {
    return TextStyle(fontSize: _calculateFontSize(20), fontWeight: FontWeight.bold, color: Colors.black);
  }
  static getPokeInfoTextStyle() {
    return TextStyle(fontSize: _calculateFontSize(16), color: Colors.black);
  }


  static _calculateFontSize(int size){

    if(ScreenUtil().orientation== Orientation.portrait){
      return (size*1.8).sp;
      
    }else{
      return size.sp;
    }


  }
 
}
