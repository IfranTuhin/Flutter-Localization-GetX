import 'package:flutter/material.dart';
import 'package:flutter_multiple_language/language_controller/language_controller.dart';
import 'package:flutter_multiple_language/model/language_model.dart';
import 'package:flutter_multiple_language/utils/app_constants.dart';


class LanguageWidget extends StatelessWidget {

  final LanguageModel languageModel;
  final LanguageController languageController;
  final int index;
  LanguageWidget({required this.languageModel, required this.languageController, required this.index});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        languageController.setLanguage(Locale(
          AppConstants.languages[index].languageCode,
          AppConstants.languages[index].countryCode,
        ));
        languageController.setSelectIndex(index);
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[200]!,
              blurRadius: 10, spreadRadius: 2,
            ),
          ],
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
               children: [
                 const SizedBox(height: 5,),
                 Text(languageModel.languageName, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black87),),
               ],
              ),
            ),
            languageController.selectedIndex == index ? const Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: 0,
              child: Icon(Icons.check_circle, color: Colors.white, size: 30,),
            ) : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
