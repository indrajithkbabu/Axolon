import 'package:get/get.dart';

import '../modules/add_contacts/bindings/add_contacts_binding.dart';
import '../modules/add_contacts/views/add_contacts_view.dart';
import '../modules/detailed_contacts/bindings/detailed_contacts_binding.dart';
import '../modules/detailed_contacts/views/detailed_contacts_view.dart';
import '../modules/list_contacts/bindings/list_contacts_binding.dart';
import '../modules/list_contacts/views/list_contacts_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LIST_CONTACTS;

  static final routes = [
    GetPage(
      name: _Paths.ADD_CONTACTS,
      page: () => const AddContactsView(),
      binding: AddContactsBinding(),
    ),
    GetPage(
      name: _Paths.LIST_CONTACTS,
      page: () => const ListContactsView(),
      binding: ListContactsBinding(),
    ),
    GetPage(
      name: _Paths.DETAILED_CONTACTS,
      page: () =>  DetailedContactsView(),
      binding: DetailedContactsBinding(),
    ),
  ];
}
