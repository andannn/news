
import 'package:flutter/cupertino.dart';
import 'package:news/app/local/nia_localizations.dart';

class NiaLocalizationsDelegate extends LocalizationsDelegate<NiaLocalizations> {
  @override
  bool isSupported(Locale locale) {
    return ['en', 'Jpan', 'ja', 'zh'].contains(locale.languageCode);
  }

  @override
  Future<NiaLocalizations> load(Locale locale) async {
    switch (locale.languageCode) {
      case 'Jpan':
      case 'ja':
        return JaNiaLocalizations();
      case 'zh':
        return CnNiaLocalizations();
      default:
        return EnNiaLocalizations();
    }
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<NiaLocalizations> old) {
    return false;
  }

}
