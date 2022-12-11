import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_study/res/app_context_extensions.dart';

class MyTextFormWidget extends StatelessWidget {
  final TextInputType keyboardType;
  final String placeholder;
  final String labelText;

  MyTextFormWidget({
    this.keyboardType = TextInputType.text,
    this.placeholder = "",
    this.labelText = ""  
    });

  @override
  Widget build(BuildContext context) {
    TextFormField field = TextFormField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: placeholder,
        labelStyle: TextStyle(color: context.resources.color.colorSecondaryText)),
        validator: (value){
          if(value!.isEmpty){
            return "This field can not be empty";
          }
        }
      );
    return field;
  }


}