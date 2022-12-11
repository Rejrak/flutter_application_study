import 'package:flutter/material.dart';
import 'package:flutter_application_study/res/app_context_extensions.dart';

class MyTextWidget extends StatelessWidget {
  final String label;
  final Color color;
  final double fontSize;

  MyTextWidget({
    this.label = "",
    this.color = Colors.black54,
    this.fontSize = 0
  });
  
  @override
  Widget build(BuildContext context) {
    double fSize = fontSize;
    if(fSize == 0){
      fSize = context.resources.dimension.bigText;
    }
    return Text(label, style: TextStyle(color: color, fontSize: fSize));
  }


}