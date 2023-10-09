part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.start() = _Started;
  const factory UserEvent.fetchUserData() = _FetchUserData;
  const factory UserEvent.logout() = _Logout;
}
