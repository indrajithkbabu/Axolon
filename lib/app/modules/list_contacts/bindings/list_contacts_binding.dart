import 'package:get/get.dart';

import '../controllers/list_contacts_controller.dart';

class ListContactsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListContactsController>(
      () => ListContactsController(),
    );
  }
}
