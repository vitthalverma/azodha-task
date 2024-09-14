import 'package:azodha_task/core/network/failure.dart';
import 'package:azodha_task/core/network/network_exceptions.dart';
import 'package:azodha_task/features/contact/data/models/contact_model.dart';
import 'package:azodha_task/features/contact/data/remote_data/contact_remote_data.dart';
import 'package:azodha_task/features/contact/domain/entity/contact.dart';
import 'package:azodha_task/features/contact/domain/repository/contact_repository.dart';
import 'package:fpdart/fpdart.dart';

class ContactRepositoryImpl implements ContactRepository {
  final ContactRemoteDataSource contactRemoteDataSource;

  ContactRepositoryImpl(this.contactRemoteDataSource);
  @override
  Future<Either<Failure, void>> addContact(Contact contact) async {
    try {
      final contactModel = ContactModel(
        name: contact.name,
        email: contact.email,
        phoneNumber: contact.phoneNumber,
        address: contact.address,
      );
      await contactRemoteDataSource.addContact(contactModel);
      return right(null);
    } on NtwkExceptions catch (e) {
      return left(Failure(e.message));
    }
  }
}
