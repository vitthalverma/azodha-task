import 'package:azodha_task/features/contact/domain/entity/contact.dart';

class ContactModel extends Contact {
  ContactModel({
    required super.name,
    required super.email,
    required super.phoneNumber,
    required super.address,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'address': address,
    };
  }
}
