import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:untitled4/core/presentation/custom_button.dart';

class CustomWidgetScreen extends StatefulWidget {
  const CustomWidgetScreen({super.key});

  @override
  State<CustomWidgetScreen> createState() => _CustomWidgetScreenState();
}

class _CustomWidgetScreenState extends State<CustomWidgetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Widget"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
        child: Column(
          children: [
            CustomButton(
              buttonText: "ar".tr(),
              color: Colors.blue,
              borderColor: Colors.deepOrangeAccent,
              onTap: () {
                if (context.locale == Locale('ar')) {
                  context.setLocale(Locale('en'));
                } else if (context.locale.languageCode == 'en') {
                  context.setLocale(Locale('ar'));
                }
              },
            ),
            SizedBox(height: 25),
            CustomButton(
              buttonText: "en".tr(),
              color: Colors.blue,
              borderColor: Colors.deepOrangeAccent,
              onTap: () {
                // context.setLocale(Locale('en'));
                print("object");
              },
            ),
          ],
        ),
      ),
    );
  }
}
