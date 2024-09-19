
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BigText extends StatelessWidget {
  final String text;
  double? size;
  Color? color;
  TextOverflow? textOverflow;
  FontWeight? fontWeight;
  
  BigText( 
  {super.key ,
  required this.text,
  this.size=20.0,
  this.color=const Color.fromARGB(255, 0, 0, 0),
  this.textOverflow=TextOverflow.ellipsis,
  this.fontWeight=FontWeight.w500});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
       maxLines: 1,
       style: TextStyle(
        fontSize: size,
        color: color,
        overflow: textOverflow,
        fontWeight: fontWeight
        
      ),
    );
  }
}

// ignore: must_be_immutable
class SmallText extends StatelessWidget {
  final String text;
  double? size;
  Color? color;
  TextOverflow? textOverflow;

  SmallText({
  super.key ,
  required this.text,
  this.size=15.0,
  this.color=const Color.fromARGB(255, 43, 43, 43),  // the color should have this format or hex only when initializing it 
  this.textOverflow=TextOverflow.ellipsis});

  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
       //maxLines: 1,
       style: TextStyle(
        fontSize: size,
        color: color,
        height: 1.3,
      ),
    );
  }
}