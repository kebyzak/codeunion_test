import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    @Default(null) String? nickname,
    @Default(null) String? email,
  }) = _User;
}