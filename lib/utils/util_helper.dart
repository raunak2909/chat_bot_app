import 'package:flutter/material.dart';

class AppColors{
  static const Color bgColor = Color(0xff101010);
  static const Color secondaryColor = Color(0xff202023);
  static const Color mGreyColor = Color(0xff9E9E9E);
}

TextStyle mTextStyle16({Color mColor = Colors.black, FontWeight mFontWeight = FontWeight.normal}){
  return TextStyle(
  fontSize: 16,
  fontFamily: 'mainFont',
    color: mColor,
    fontWeight: mFontWeight,
  );
}

TextStyle mTextStyle25({Color mColor = Colors.black, FontWeight mFontWeight = FontWeight.normal}){
  return TextStyle(
    fontSize: 16,
    fontFamily: 'mainFont',
    color: mColor,
    fontWeight: mFontWeight,
  );
}

TextStyle mTextStyle12({Color mColor = Colors.black, FontWeight mFontWeight = FontWeight.normal}){
  return TextStyle(
    fontSize: 16,
    fontFamily: 'mainFont',
    color: mColor,
    fontWeight: mFontWeight,
  );
}