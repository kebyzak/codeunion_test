part of 'navigation_bloc.dart';

@freezed
class NavigationState with _$NavigationState {
  const factory NavigationState.initial() = Initial;
  const factory NavigationState.loading() = Loading;
  const factory NavigationState.success({required int tabIndex}) = Success;
  const factory NavigationState.error() = Error;
}
