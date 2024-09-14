import 'package:azodha_task/features/contact/domain/usecases/add_contact_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final AddContactUsecase addContactUsecase;
  ContactBloc(this.addContactUsecase) : super(ContactInitial()) {
    //
    on<AddContactEvent>((event, emit) async {
      emit(ContactLoading());
      if (event.name.isEmpty ||
          event.email.isEmpty ||
          event.phoneNumber.isEmpty ||
          event.address.isEmpty) {
        return emit(const ContactError(error: 'Please enter all fields'));
      }
      final result = await addContactUsecase(AddContactParams(
        name: event.name,
        email: event.email,
        phone: event.phoneNumber,
        address: event.address,
      ));

      result.fold(
        (e) => emit(ContactError(error: e.msg)),
        (r) => emit(ContactAdded()),
      );
    });
  }
}
