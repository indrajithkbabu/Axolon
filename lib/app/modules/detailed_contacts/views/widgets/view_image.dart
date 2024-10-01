import 'dart:io';
import 'package:flutter/material.dart';

class ViewImageDialog extends StatelessWidget {
  final String imagePath;

  const ViewImageDialog({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: FileImage(File(imagePath)),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
