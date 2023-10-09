part of 'navigation_bloc.dart';

@freezed
class NavigationEvent with _$NavigationEvent {
  const factory NavigationEvent.start() = _Started;
  const factory NavigationEvent.tabChanged({required int tabIndex}) = _TabChanged;
}
