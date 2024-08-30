import 'package:flutter/material.dart';
import 'package:flutter_multiple_language/language_controller/language_controller.dart';
import 'package:flutter_multiple_language/screen/widget/language_widget.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'.tr),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GetBuilder<LanguageController>(
              builder: (languageController) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text('select_language'.tr, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 5),
                    Text('you_can_change_language'.tr, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),

                    const SizedBox(height: 40),

                    GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return LanguageWidget(
                          index: index,
                          languageModel: languageController.languages[index],
                          languageController: languageController,
                        );
                      },
                    ),

                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
