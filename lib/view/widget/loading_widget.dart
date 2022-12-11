import 'package:flutter/material.dart';
import 'package:flutter_application_study/res/app_context_extensions.dart';

class LoadingWidget extends StatelessWidget{
  const LoadingWidget({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 8),
          Text(context.resources.strings.LablLoading)
        ]

      ),
    );
  }
}