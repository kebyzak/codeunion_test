import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'navigation_bloc.freezed.dart';
part 'navigation_state.dart';
part 'navigation_event.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const NavigationState.initial()){
    on<_Started>((event, emit) async {
      await Future.delayed(const Duration(milliseconds: 2000));
      emit(const NavigationState.initial());
    });
    on<_TabChanged>((event, emit) async {
      emit(NavigationState.success(tabIndex: event.tabIndex));
    });
  }
}