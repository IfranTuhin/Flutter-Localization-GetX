import 'package:flutter/material.dart';
import 'package:flutter_multiple_language/language_controller/language_controller.dart';
import 'package:flutter_multiple_language/screen/home_screen.dart';
import 'package:flutter_multiple_language/utils/app_constants.dart';
import 'package:flutter_multiple_language/utils/messages.dart';
import 'package:get/get.dart';
import 'utils/dev.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Map<String, Map<String, String>> _languages = await dep.init();

  runApp(MyApp(languages: _languages));
}

class MyApp extends StatelessWidget {
  MyApp({required this.languages});

  final Map<String, Map<String, String>> languages;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return GetBuilder<LanguageController>(
      builder: (languageController) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          locale: languageController.locale,
          translations: Messages(languages: languages),
          fallbackLocale: Locale(AppConstants.languages[0].languageCode, AppConstants.languages[0].countryCode),
          home: const HomeScreen(),
        );
      },
    );
  }
}

