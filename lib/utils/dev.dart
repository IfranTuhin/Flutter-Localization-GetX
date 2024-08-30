
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_multiple_language/language_controller/language_controller.dart';
import 'package:flutter_multiple_language/model/language_model.dart';
import 'package:flutter_multiple_language/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Map<String, Map<String, String>>> init() async {
  
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut( () => sharedPreferences);
  
  Get.lazyPut(() => LanguageController(sharedPreferences: Get.find()));
  
  // Retrieving localization data 
  Map<String, Map<String, String>> _languages = Map();
  for(LanguageModel languageModel in AppConstants.languages) {
    String jsonStringValues = await rootBundle.loadString('assets/language/${languageModel.languageCode}.json');
    Map<String, dynamic> _mappedJson = json.decode(jsonStringValues);
    Map<String, String> _json = Map();

    _mappedJson.forEach((key, value) {
      _json[key] = value.toString();
    });
    // en bn
    _languages['${languageModel.languageCode}_${languageModel.countryCode}'] = _json;
  }
  return _languages;
}