import 'dart:async';

import 'package:azodha_task/bootstrap.dart';
import 'package:azodha_task/features/contact/presentation/bloc/contact_bloc.dart';
import 'package:azodha_task/features/contact/presentation/screens/home_screen.dart';
import 'package:azodha_task/firebase_options.dart';
import 'package:azodha_task/injection_container.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initDependencies();
  unawaited(bootstrap(() => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => sl<ContactBloc>())],
      child: ResponsiveSizer(
        builder: (p0, p1, p2) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
              useMaterial3: true,
            ),
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
