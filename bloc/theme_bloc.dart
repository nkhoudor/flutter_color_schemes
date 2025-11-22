import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../themes.dart';
import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(ThemeState(
          lightTheme: PredefinedTheme.cozy.lightTheme,
          darkTheme: PredefinedTheme.cozy.darkTheme,
          themeMode: ThemeMode.light,
        )) {
    on<ToggleThemeEvent>(_onToggleTheme);
    on<SetLightThemeEvent>(_onSetLightTheme);
    on<SetDarkThemeEvent>(_onSetDarkTheme);
  }

  void _onToggleTheme(ToggleThemeEvent event, Emitter<ThemeState> emit) {
    final newThemeMode = state.themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    emit(state.copyWith(themeMode: newThemeMode));
  }

  void _onSetLightTheme(SetLightThemeEvent event, Emitter<ThemeState> emit) {
    emit(state.copyWith(themeMode: ThemeMode.light));
  }

  void _onSetDarkTheme(SetDarkThemeEvent event, Emitter<ThemeState> emit) {
    emit(state.copyWith(themeMode: ThemeMode.dark));
  }
}

