import 'package:flutter/material.dart';

class SnackBarHelper {
  SnackBarHelper._();

  static void showSnackbar({
    required String message,  
    required BuildContext context,  
    Color? backgroundColor, 
    Duration? duration,  
  }) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),  
          backgroundColor: backgroundColor ?? Colors.grey,  
          duration: duration ?? const Duration(seconds: 2),  
        ),
      );
  }
}