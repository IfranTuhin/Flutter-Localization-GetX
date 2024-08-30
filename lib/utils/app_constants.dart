import 'package:flutter_multiple_language/model/language_model.dart';

class AppConstants {
  /*
  Localization data
   */
  static const String COUNTRY_CODE = 'country_code';
  static const String LANGUAGE_CODE = 'language_code';
  
  static List<LanguageModel> languages = [
    LanguageModel(imageUrl: 'en.png', languageName: 'English', languageCode: 'en', countryCode: 'EN'),
    LanguageModel(imageUrl: 'bn.png', languageName: 'বাংলা', languageCode: 'bn', countryCode: 'BN'),
  ];
}