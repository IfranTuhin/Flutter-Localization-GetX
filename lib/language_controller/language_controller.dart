

import 'dart:ui';

import 'package:flutter_multiple_language/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/language_model.dart';

class LanguageController extends GetxController implements GetxService {
  final SharedPreferences sharedPreferences;

  LanguageController({required this.sharedPreferences}) {
    loadCurrentLanguage();
  }

  Locale _locale = Locale(AppConstants.languages[0].languageCode, AppConstants.languages[0].countryCode);
  Locale get locale => _locale;

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  List<LanguageModel> _langugae = [];
  List<LanguageModel> get languages => _langugae;

  loadCurrentLanguage() async {
    // Only gets called during installation or reboot
    _locale = Locale(sharedPreferences.getString(AppConstants.LANGUAGE_CODE) ?? AppConstants.languages[0].languageCode,
    sharedPreferences.getString(AppConstants.COUNTRY_CODE) ?? AppConstants.languages[0].countryCode);

    for (int index = 0; index < AppConstants.languages.length; index++) {
      if(AppConstants.languages[index].languageCode == _locale.languageCode) {
        _selectedIndex = index;
        break;
      }
    }

    _langugae = [];
    _langugae.addAll(AppConstants.languages);
    update();
  }

  void setLanguage (Locale locale) {
    Get.updateLocale(locale);
    _locale = locale;
    saveLanguage(_locale);
    update();
  }

  void setSelectIndex (int index) {
    _selectedIndex = index;
    update();
  }

  void saveLanguage (Locale locale) async {
    sharedPreferences.setString(AppConstants.LANGUAGE_CODE, locale.languageCode);
    sharedPreferences.setString(AppConstants.COUNTRY_CODE, locale.countryCode!);
  }

}