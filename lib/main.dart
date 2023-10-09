import 'package:codeunion_test/presentation/bloc/navigation/navigation_bloc.dart';
import 'package:codeunion_test/presentation/bloc/user/user_bloc.dart';
import 'package:codeunion_test/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/repository/user_repository.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final appRouter = AppRouter();
  final userRepository = UserRepository();
  final String email = 'maripbekoff@gmail.com';
  final String password = 'adminadmin';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationBloc>(create: (_) => NavigationBloc()),
        BlocProvider<UserBloc>(
          create: (_) => UserBloc(userRepository, email, password),
        ),
      ],
      child: MaterialApp.router(
        theme: ThemeData(fontFamily: 'Manrope'),
        debugShowCheckedModeBanner: false,
        routerDelegate: appRouter.delegate(),
        routeInformationParser: appRouter.defaultRouteParser(),
      ),
    );
  }
}
