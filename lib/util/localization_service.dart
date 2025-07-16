import 'package:flutter/material.dart';
import 'package:flutter_training/gen_l10n/app_localizations.dart';

class LocalizationService {
  static AppLocalizations? _current;

  static AppLocalizations get current {
    if (_current == null) {
      throw Exception('LocalizationService.current chưa được khởi tạo.');
    }
    return _current!;
  }

  static void update(BuildContext context) {
    _current = AppLocalizations.of(context);
  }
}
