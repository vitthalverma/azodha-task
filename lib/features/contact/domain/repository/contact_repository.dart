import 'package:azodha_task/core/network/failure.dart';
import 'package:azodha_task/features/contact/domain/entity/contact.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class ContactRepository {
  Future<Either<Failure, void>> addContact(Contact contact);
}
