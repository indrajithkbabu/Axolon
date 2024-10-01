import 'dart:io';
import 'dart:math';

import 'package:contactapp/app/modules/list_contacts/controllers/list_contacts_controller.dart';
import 'package:contactapp/app/helpers/common_functions/image_picker_helper.dart';
import 'package:contactapp/app/models/contact_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddContactsController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final groupController = TextEditingController();
  final FocusNode myFocusNode = FocusNode();

  var contacts = <ContactModel>[].obs;
  var profilePhoto = ''.obs;
  var name = ''.obs;
  var phone = ''.obs;
  var email = ''.obs;
  var group = ''.obs;
  var isValidateProfilePhoto = false.obs;
  var isEdit = false;

  @override
  void onInit() {
    super.onInit();
    // Check if the contact is being edited
    if (Get.arguments != null && Get.arguments['isEdit'] == true) {
      final contact = Get.arguments['contact'] as ContactModel;
      nameController.text = contact.name;
      phoneController.text = contact.phoneNumber;
      emailController.text = contact.email;
      groupController.text = contact.group;
      profilePhoto.value = contact.profilePhoto;
      isEdit = true;
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    groupController.dispose();
    myFocusNode.dispose();
    super.onClose();
  }

  //  pick image from camera or gallery
  Future<void> pickProfilePhoto(ImageSource source) async {
    final ImageService imageService = ImageService();
    File? image = await imageService.pickImage(source);
    if (image != null) {
      profilePhoto.value = image.path;
    } else {
      profilePhoto.value = '';
    }
  }

  void validateProfilePhoto() {
    isValidateProfilePhoto.value = true;
  }

  String generateUniqueId() {
    int timestamp = DateTime.now().millisecondsSinceEpoch;
    int randomPart = Random().nextInt(10000);
    return '$timestamp$randomPart';
  }

  // add a new contact
  void saveContact() {
    if (formKey.currentState!.validate()) {
      if (isEdit) {
        var updatedContact = ContactModel(
          id: Get.arguments['contact'].id,
          name: nameController.text,
          phoneNumber: phoneController.text,
          email: emailController.text,
          group: groupController.text,
          profilePhoto: profilePhoto.value,
        );

     
        Get.find<ListContactsController>().updateContact(updatedContact);
      } else {
     
        var newContact = ContactModel(
          id: generateUniqueId(),
          name: nameController.text,
          phoneNumber: phoneController.text,
          email: emailController.text,
          group: groupController.text,
          profilePhoto: profilePhoto.value,
        );
        Get.find<ListContactsController>().addNewContact(newContact);
      }

      Get.back();
    }
  }

  // clear the fields
  void clearFields() {
    name.value = '';
    phone.value = '';
    email.value = '';
    group.value = '';
    profilePhoto.value = '';
  }
}
