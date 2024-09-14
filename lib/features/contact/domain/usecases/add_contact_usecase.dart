import 'package:azodha_task/core/network/failure.dart';
import 'package:azodha_task/core/usecase/core_usecase.dart';
import 'package:azodha_task/features/contact/domain/entity/contact.dart';
import 'package:azodha_task/features/contact/domain/repository/contact_repository.dart';
import 'package:fpdart/fpdart.dart';

class AddContactUsecase implements CoreUsecases<void, AddContactParams> {
  final ContactRepository contactRepository;

  AddContactUsecase(this.contactRepository);
  @override
  Future<Either<Failure, void>> call(input) async {
    final contact = Contact(
      name: input.name,
      email: input.email,
      phoneNumber: input.phone,
      address: input.address,
    );
    return await contactRepository.addContact(contact);
  }
}

class AddContactParams {
  final String name;
  final String email;
  final String phone;
  final String address;

  AddContactParams(
      {required this.name,
      required this.email,
      required this.phone,
      required this.address});
}
