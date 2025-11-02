import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class AppConfigProvider extends ChangeNotifier {
  String _locale = "en";
  SharedPreferences sharedPreferences;
  AppConfigProvider(this.sharedPreferences);

  set locale(String newLocale) {
    if (newLocale == _locale) return;
    _locale = newLocale;
    sharedPreferences.setString("locale", _locale);
    notifyListeners();
  }
}
