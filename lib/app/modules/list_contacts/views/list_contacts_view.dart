import 'package:contactapp/app/helpers/common_widgets/alert_box.dart';
import 'package:contactapp/app/helpers/common_widgets/custom_text_form_field.dart';
import 'package:contactapp/app/modules/list_contacts/controllers/list_contacts_controller.dart';
import 'package:contactapp/app/routes/app_pages.dart';
import 'package:contactapp/app/utils/colors.dart';
import 'package:contactapp/app/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:contactapp/app/models/contact_model.dart';

class ListContactsView extends GetView<ListContactsController> {
  const ListContactsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryColor,
        title: Obx(() {
          return controller.isSearch.value
              ? CustomTextFormField(
                  hintText: 'Search contacts here',
                  hintStyle: TextStyles.bodyText,
                  controller: controller.searchController,
                  focusNode: controller.searchFocusNode,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  onChanged: (value) {
                    controller.searchContacts(value);
                  },
                )
              : const Text('Contacts', style: TextStyles.headline);
        }),
        actions: [
          GestureDetector(
              onTap: () {
                controller.toggleIsSearch();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Obx(
                  () => !controller.isSearch.value
                      ? const Icon(
                          Icons.search,
                          color: AppColors.backgroundColor,
                        )
                      : const Icon(
                          Icons.close,
                          color: AppColors.backgroundColor,
                        ),
                ),
              ))
        ],
      ),
      body: Obx(() {
        if (controller.filteredContacts.isEmpty) {
          return const Center(child: Text('No contacts added.'));
        } else {
          return ListView.builder(
            itemCount: controller.filteredContacts.length,
            itemBuilder: (context, index) {
              ContactModel contactDetails = controller.filteredContacts[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppColors.primaryColor,
                  child: Text(
                    contactDetails.name.characters.first.toUpperCase(),
                    style: TextStyles.headline.copyWith(fontSize: 20),
                  ),
                ),
                title: Text(contactDetails.name),
                subtitle: Text(contactDetails.phoneNumber),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    ConfirmAlert.showConfirmAlert(
                      context: context,
                      contentText:
                          'Are you sure you want to delete this contact?',
                      confirmTitle: 'Continue',
                      onPressedContinue: () {
                        controller.deleteContact(contactDetails.id);
                      },
                    );
                  },
                ),
                onTap: () {
                  Get.toNamed(
                    Routes.DETAILED_CONTACTS,
                    arguments: {
                      'contact': contactDetails,
                      'index': index,
                    },
                  );
                },
              );
            },
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        shape: const CircleBorder(),
        onPressed: () {
          Get.toNamed(Routes.ADD_CONTACTS);
        },
        child: const Icon(
          Icons.add,
          color: AppColors.backgroundColor,
        ),
      ),
    );
  }
}
