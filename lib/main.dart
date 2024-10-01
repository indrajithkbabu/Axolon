import 'package:contactapp/app/models/contact_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  final directory=await path_provider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(ContactModelAdapter());
  await Hive.openBox<ContactModel>('contactBox');
  runApp(
    GetMaterialApp(
      title: "Contact App",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}
