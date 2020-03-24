import 'package:flutter/widgets.dart';
import 'package:flutter_template/repository/shared_prefs/shared_prefs_storing.dart';

class LocaleRepository {
  static const _STORE_LOCALE = 'locale';

  final SharedPrefsStoring _sharedPrefs;

  LocaleRepository(this._sharedPrefs);

  Future<void> setCustomLocale(Locale locale) async {
    if (locale == null) {
      await _sharedPrefs.deleteKey(_STORE_LOCALE);
      return;
    }
    await _sharedPrefs.saveString(key: _STORE_LOCALE, value: locale.languageCode);
  }

  Future<Locale> getCustomLocale() async {
    final localeCode = _sharedPrefs.getString(_STORE_LOCALE);
    if (localeCode == null || localeCode.isEmpty) return null;
    return Locale(localeCode);
  }
}
