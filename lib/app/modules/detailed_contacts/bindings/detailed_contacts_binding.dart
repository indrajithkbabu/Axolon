import 'package:get/get.dart';

import '../controllers/detailed_contacts_controller.dart';

class DetailedContactsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailedContactsController>(
      () => DetailedContactsController(),
    );
  }
}
