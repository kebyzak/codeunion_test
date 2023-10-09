import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/repository/user_repository.dart';
import '../../models/user.dart';

part 'user_bloc.freezed.dart';

part 'user_state.dart';

part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  String? email;
  String? password;

  UserBloc(this.userRepository, this.email, this.password)
      : super(const UserState.initial()) {
    on<_Started>((event, emit) async {
      await Future.delayed(const Duration(seconds: 2));
      emit(const UserState.initial());
    });

    on<_FetchUserData>((event, emit) async {
      if (email == null || password == null) {
        emit(const UserState.error());
        return;
      }

      emit(const UserState.loading());
      final user = await userRepository.signIn(email!, password!);
      if (user != null) {
        emit(UserState.success(user));
      } else {
        emit(const UserState.error());
      }
    });
    on<_Logout>((event, emit) async {
      emit(const UserState.loggedOut());
    });
  }
}
