import 'dart:io';

import 'package:contactapp/app/helpers/common_functions/validators.dart';
import 'package:contactapp/app/helpers/common_widgets/custom_text_form_field.dart';
import 'package:contactapp/app/utils/colors.dart';
import 'package:contactapp/app/utils/text_styles.dart';
import 'package:contactapp/app/utils/values.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/add_contacts_controller.dart';

class AddContactsView extends GetView<AddContactsController> {
  const AddContactsView({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(controller.myFocusNode);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.primaryColor,
          title: Text(controller.isEdit ? 'Edit Contact' : 'Add Contact',
              style: TextStyles.headline),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GestureDetector(
                onTap: () {
                  controller.validateProfilePhoto();
                  bool isFormValid =
                      controller.formKey.currentState!.validate();
                  bool isProfilePhotoValid = controller.profilePhoto.isNotEmpty;
                  if (isFormValid && isProfilePhotoValid) {
                    controller.name.value = controller.nameController.text;
                    controller.phone.value = controller.phoneController.text;
                    controller.email.value = controller.emailController.text;
                    controller.group.value = controller.groupController.text;
                    controller.saveContact();

                    Get.back();
                  }
                },
                child: const Text('Save', style: TextStyles.bodyText),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              top: 20,
              left: 20,
              right: 20),
          child: Obx(() {
            return Form(
                key: controller.formKey,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    AppSpacing.gapNormal(isHeight: true),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {
                              _showImageSourceDialog(context);
                            },
                            child: CircleAvatar(
                              backgroundColor: AppColors.primaryColor,
                              radius: 50,
                              child: controller.profilePhoto.isEmpty
                                  ? const Icon(
                                      Icons.camera_alt,
                                      color: AppColors.backgroundColor,
                                    )
                                  : ClipOval(
                                      child: Image.file(
                                        File(controller.profilePhoto.value),
                                        fit: BoxFit.cover,
                                        width: 100,
                                        height: 100,
                                      ),
                                    ),
                            )),
                      ],
                    ),
                    AppSpacing.gapNormal(isHeight: true),
                    Center(
                      child: Visibility(
                          visible: controller.profilePhoto.isEmpty &&
                              controller.isValidateProfilePhoto.value,
                          child: const Text(
                            'Please add photo',
                            style: TextStyle(color: AppColors.errorColor),
                          )),
                    ),
                    AppSpacing.gapSmall(isHeight: true),
                    Row(
                      children: [
                        const Icon(Icons.person),
                        AppSpacing.gapSmall(isHeight: false),
                        Expanded(
                            child: CustomTextFormField(
                          hintText: 'Name',
                          controller: controller.nameController,
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                          validator: ValidatorHelper.validateName,
                          onChanged: (value) {
                            controller.name.value = value;
                          },
                        )),
                      ],
                    ),
                    AppSpacing.gapSmall(isHeight: true),
                    Row(
                      children: [
                        const Icon(Icons.phone),
                        AppSpacing.gapSmall(isHeight: false),
                        Expanded(
                            child: CustomTextFormField(
                          hintText: 'Phone',
                          controller: controller.phoneController,
                          keyboardType: TextInputType.number,
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                          validator: ValidatorHelper.validateMobile,
                          onChanged: (value) {
                            controller.phone.value = value;
                          },
                        )),
                      ],
                    ),
                    AppSpacing.gapSmall(isHeight: true),
                    Row(
                      children: [
                        const Icon(Icons.email),
                        AppSpacing.gapSmall(isHeight: false),
                        Expanded(
                            child: CustomTextFormField(
                          hintText: 'Email',
                          controller: controller.emailController,
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                          keyboardType: TextInputType.emailAddress,
                          validator: ValidatorHelper.validateEmail,
                          onChanged: (value) {
                            controller.email.value = value;
                          },
                        )),
                      ],
                    ),
                    AppSpacing.gapSmall(isHeight: true),
                    Row(
                      children: [
                        const Icon(Icons.group),
                        AppSpacing.gapSmall(isHeight: false),
                        Expanded(
                            child: CustomTextFormField(
                          hintText: 'Group',
                          controller: controller.groupController,
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                          validator: ValidatorHelper.validateGroup,
                          onChanged: (value) {
                            controller.group.value = value;
                          },
                        )),
                      ],
                    ),
                    AppSpacing.gapSmall(isHeight: true),
                  ],
                ));
          }),
        ),
      ),
    );
  }

  void _showImageSourceDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera),
              title: const Text('Take Photo'),
              onTap: () {
                controller.pickProfilePhoto(ImageSource.camera);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from Gallery'),
              onTap: () {
                controller.pickProfilePhoto(ImageSource.gallery);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
