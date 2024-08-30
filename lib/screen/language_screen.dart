import 'package:flutter/material.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language Screen'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Text('select_language', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),

              const SizedBox(height: 20),

              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                ),
                itemCount: 2,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => const SizedBox(width: 300, height: 300,),
              ),

              const SizedBox(height: 20),

              Text('change_your_language', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),


            ],
          ),
        ),
      ),
    );
  }
}
