import 'dart:io';

import 'package:contactapp/app/modules/detailed_contacts/views/widgets/custom_row_tile.dart';
import 'package:contactapp/app/modules/detailed_contacts/views/widgets/view_image.dart';
import 'package:contactapp/app/routes/app_pages.dart';
import 'package:contactapp/app/utils/colors.dart';
import 'package:contactapp/app/utils/text_styles.dart';
import 'package:contactapp/app/utils/values.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detailed_contacts_controller.dart';

class DetailedContactsView extends GetView<DetailedContactsController> {
  const DetailedContactsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.backgroundColor,
            )),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed(
                  Routes.ADD_CONTACTS,
                  arguments: {
                    'contact': controller.contactDetails,
                    'isEdit': true,
                  },
                );
              },
              icon: Icon(
                Icons.edit,
                color: AppColors.backgroundColor,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width,
                  color: AppColors.primaryColor,
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return ViewImageDialog(
                          imagePath: controller.contactDetails.profilePhoto,
                        );
                      },
                    );
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 80,
                    child: controller.contactDetails.profilePhoto.isEmpty
                        ? const Icon(
                            Icons.camera_alt,
                            color: Colors.white60,
                          )
                        : ClipOval(
                            child: Image.file(
                              File(controller.contactDetails.profilePhoto),
                              fit: BoxFit.cover,
                              width: 200,
                              height: 200,
                            ),
                          ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  child: Text(controller.contactDetails.name,
                      style: TextStyles.headline),
                ),
              ],
            ),
            AppSpacing.gapNormal(isHeight: true),
            CustomRowTile(
              title: controller.contactDetails.phoneNumber,
              subtitle: 'Telephone',
              prefixIcon: Icons.phone,
              suffixIcon: Icons.message,
            ),
            CustomRowTile(
              title: controller.contactDetails.email,
              subtitle: 'Email',
              prefixIcon: Icons.email,
            ),
            CustomRowTile(
              title: 'Share contact',
              prefixIcon: Icons.share,
            )
          ],
        ),
      ),
    );
  }
}
