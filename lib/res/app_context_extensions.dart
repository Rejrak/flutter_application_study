import 'package:flutter/cupertino.dart';
import 'package:flutter_application_study/res/resources.dart';

extension AppContextExtension on BuildContext {
  Resources get resources => Resources.of(this);
}

