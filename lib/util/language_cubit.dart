import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/util/shared_preference.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(const Locale('en')) {
    loadSavedLocale();
  }

  Future<void> loadSavedLocale() async {
    final code = await SharedPreferenceUtil.getSavedLocale();
    if (code != null) {
      emit(Locale(code));
    }
  }

  Future<void> changeLocale(Locale locale) async {
    await SharedPreferenceUtil.saveLocale(locale.languageCode);
    emit(locale);
  }
}
