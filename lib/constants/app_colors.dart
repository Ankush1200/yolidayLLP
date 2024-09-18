import 'package:flutter/material.dart';

class AppColors{
  static const Color orange=Color(0xffDF5532);
  static const Color grey=Color(0xffD6D1D5);
  static const Color black=Color(0xff303030);
  static const Color white= Color(0xffFFFFFF);


  static BoxDecoration gradientDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    gradient:const LinearGradient(
      colors: [
        Color(0xFFF39519),
        Color(0xFFFFCD67),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0.0, 1.0], 
      tileMode: TileMode.clamp,
    ),
  );
}