import 'package:azodha_task/features/contact/data/remote_data/contact_remote_data.dart';
import 'package:azodha_task/features/contact/data/repository/contact_repository_impl.dart';
import 'package:azodha_task/features/contact/domain/repository/contact_repository.dart';
import 'package:azodha_task/features/contact/domain/usecases/add_contact_usecase.dart';
import 'package:azodha_task/features/contact/presentation/bloc/contact_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  _initContact();
}

Future<void> _initContact() async {
  // Datasource
  sl
    ..registerFactory<ContactRemoteDataSource>(
        () => ContactRemoteDataSourceImpl(sl()))
    // Repository
    ..registerFactory<ContactRepository>(() => ContactRepositoryImpl(sl()))
    // Usecases
    ..registerFactory(() => AddContactUsecase(sl()))
    // Bloc
    ..registerLazySingleton(() => ContactBloc(sl()));
}
