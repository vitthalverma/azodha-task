part of 'contact_bloc.dart';

sealed class ContactEvent extends Equatable {
  const ContactEvent();

  @override
  List<Object> get props => [];
}

class AddContactEvent extends ContactEvent {
  final String name;
  final String email;
  final String phoneNumber;
  final String address;

  const AddContactEvent(
      {required this.name,
      required this.email,
      required this.phoneNumber,
      required this.address});

  @override
  List<Object> get props => [name, email, phoneNumber, address];
}
