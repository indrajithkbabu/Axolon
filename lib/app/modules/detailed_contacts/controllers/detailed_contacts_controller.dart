import 'package:contactapp/app/models/contact_model.dart';
import 'package:get/get.dart';

class DetailedContactsController extends GetxController {
 late ContactModel contactDetails;
  late int index;
  @override
  void onInit() {
      contactDetails = Get.arguments['contact'];
    index = Get.arguments['index'];
    
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


}
