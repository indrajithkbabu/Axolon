import 'package:flutter/material.dart';

class AppValues {
  static const double gapVerySmall = 5.0;
  static const double gapSmall = 10.0;
  static const double gapMedium = 15.0;
  static const double gapNormal = 20.0;
}

class AppSpacing {
  static Widget gapVerySmall({bool isHeight = true}) {
    return SizedBox(
      height: isHeight ? AppValues.gapVerySmall : 0,
      width: isHeight ? 0 : AppValues.gapVerySmall,
    );
  }

  static Widget gapSmall({bool isHeight = true}) {
    return SizedBox(
      height: isHeight ? AppValues.gapSmall : 0,
      width: isHeight ? 0 : AppValues.gapSmall,
    );
  }

  static Widget gapMedium({bool isHeight = true}) {
    return SizedBox(
      height: isHeight ? AppValues.gapMedium : 0,
      width: isHeight ? 0 : AppValues.gapMedium,
    );
  }

  static Widget gapNormal({bool isHeight = true}) {
    return SizedBox(
      height: isHeight ? AppValues.gapNormal : 0,
      width: isHeight ? 0 : AppValues.gapNormal,
    );
  }
}
