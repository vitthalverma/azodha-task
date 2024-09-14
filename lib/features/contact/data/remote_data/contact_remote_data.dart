import 'package:azodha_task/core/network/network_exceptions.dart';
import 'package:azodha_task/features/contact/data/models/contact_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract interface class ContactRemoteDataSource {
  Future<void> addContact(ContactModel contact);
}

class ContactRemoteDataSourceImpl implements ContactRemoteDataSource {
  final FirebaseFirestore firestore;

  ContactRemoteDataSourceImpl(this.firestore);
  @override
  Future<void> addContact(ContactModel contact) async {
    try {
      //add the contact to firestore database
      await firestore.collection('contacts').add(contact.toJson());
    } on FirebaseException catch (e) {
      throw NtwkExceptions(e.message!);
    }
  }
}
