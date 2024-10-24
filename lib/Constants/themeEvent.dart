import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/Constants/theme.dart';

enum ThemeEvent { toggle } // Event to toggle the theme

class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  ThemeBloc() : super(AppThemes.darkTheme) {
    // Set the initial state to dark theme
    on<ThemeEvent>((event, emit) {
      if (state == AppThemes.lightTheme) {
        emit(AppThemes.darkTheme);
      } else {
        emit(AppThemes.lightTheme);
      }
    });
  }
}
