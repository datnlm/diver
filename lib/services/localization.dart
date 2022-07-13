import 'dart:collection';
import 'dart:ui';

import 'package:get/get.dart';
import 'locales/vn.dart' as vi;
import 'locales/en.dart' as en;

class LocalizationService extends Translations {
  static final locale = _getLocaleFromLanguage() ?? locales[0];
  // ignore: prefer_const_constructors
  static final fallbackLocale = Locale('vi', 'VN');

  static final langCodes = [
    'vi',
    'en',
  ];

  static final locales = [
    const Locale('vi', 'VN'),
    const Locale('en', 'US'),
  ];

  static final langs = LinkedHashMap.from({
    'vi': 'Tiếng Việt',
    'en': 'English',
  });

  static void changeLocale(String langCode) {
    final locale = _getLocaleFromLanguage(langCode: langCode);
    Get.updateLocale(locale!);
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'vi_VN': vi.vn,
        'en_US': en.en,
      };
  static Locale? _getLocaleFromLanguage({String? langCode}) {
    var lang = langCode;
    for (int i = 0; i < langCodes.length; i++) {
      if (lang == langCodes[i]) return locales[i];
    }
    return Get.locale;
  }
}
