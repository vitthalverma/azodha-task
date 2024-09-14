part of 'contact_bloc.dart';

sealed class ContactState extends Equatable {
  const ContactState();

  @override
  List<Object> get props => [];
}

final class ContactInitial extends ContactState {}

final class ContactLoading extends ContactState {}

final class ContactAdded extends ContactState {}

final class ContactError extends ContactState {
  final String error;

  const ContactError({required this.error});

  @override
  List<Object> get props => [error];
}
