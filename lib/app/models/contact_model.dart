import 'package:hive/hive.dart';


part 'contact_model.g.dart';

@HiveType(typeId: 0)
class ContactModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String phoneNumber;
  @HiveField(3)
  final String email;
  @HiveField(4)
  final String group;
  @HiveField(5)
  final String profilePhoto;

  ContactModel(
      {required this.id,
      required this.name,
      required this.phoneNumber,
      required this.email,
      required this.group,
      required this.profilePhoto});
}
