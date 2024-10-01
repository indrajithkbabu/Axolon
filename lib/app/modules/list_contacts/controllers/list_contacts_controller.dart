import 'package:contactapp/app/helpers/common_widgets/snackbar.dart';
import 'package:contactapp/app/models/contact_model.dart';
import 'package:contactapp/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class ListContactsController extends GetxController {
  var contacts = <ContactModel>[].obs;
  var isSearch = false.obs;
  var filteredContacts = <ContactModel>[].obs;
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();
  @override
  void onInit() {
    loadContacts();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    searchController.dispose();
    searchFocusNode.dispose();
    super.onClose();
  }

  // Load contacts from Hive
  Future<void> loadContacts() async {
    final box = await Hive.openBox<ContactModel>('contactBox');
    final List<ContactModel> loadedContacts = box.values.toList();
    contacts.assignAll(loadedContacts);
    filteredContacts.assignAll(loadedContacts);
  }

  // Save contact list to Hive
  Future<void> saveContactList() async {
    final box = await Hive.openBox<ContactModel>('contactBox');
    await box.clear();
    await box.addAll(contacts);
  }

  //list contact
  void addNewContact(ContactModel newContact) async {
    contacts.insert(0, newContact);
    await saveContactList();
    filteredContacts.assignAll(contacts);
    SnackBarHelper.showSnackbar(
      message: 'Contact added successfully!',
      backgroundColor: AppColors.successColor,
      context: Get.context!,
    );
  }

  // delete a contact
  void deleteContact(String id) async {
    contacts.removeWhere((contact) => contact.id == id);
    await saveContactList();
    filteredContacts.assignAll(contacts);
    SnackBarHelper.showSnackbar(
      message: 'Contact deleted!',
      backgroundColor: AppColors.errorColor,
      context: Get.context!,
    );
  }

  void toggleIsSearch() {
    isSearch.value = !isSearch.value;
    if (!isSearch.value) {
      searchController.clear();
      searchFocusNode.unfocus();
      filteredContacts.assignAll(contacts);
    } else {
      Future.delayed(Duration(milliseconds: 100), () {
        searchFocusNode.requestFocus();
      });
    }
  }

  //search contact
  void searchContacts(String query) {
    if (query.isEmpty) {
      filteredContacts.assignAll(contacts);
    } else {
      filteredContacts.assignAll(
        contacts.where((contact) {
          final lowerCaseQuery = query.toLowerCase();
          return contact.name.toLowerCase().contains(lowerCaseQuery) ||
              contact.phoneNumber.toLowerCase().contains(lowerCaseQuery) ||
              contact.email.toLowerCase().contains(lowerCaseQuery) ||
              contact.group.toLowerCase().contains(lowerCaseQuery);
        }).toList(),
      );
    }
  }

//update contact
  void updateContact(ContactModel updatedContact) async {
    int index =
        contacts.indexWhere((contact) => contact.id == updatedContact.id);
    if (index != -1) {
      contacts[index] = updatedContact;
      await saveContactList();
      filteredContacts.assignAll(contacts);
      SnackBarHelper.showSnackbar(
        message: 'Contact updated successfully!',
        backgroundColor: AppColors.successColor,
        context: Get.context!,
      );
    }
  }
}
