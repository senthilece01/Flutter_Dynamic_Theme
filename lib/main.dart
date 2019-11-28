import 'package:flutter/material.dart';
import 'package:flutter_dynamic_theme/views/settings_view.dart';
import 'package:flutter_dynamic_theme/widgets/custom_theme.dart';

void main() => runApp(
      CustomTheme(
        initialThemeKey: MyThemeKeys.LIGHT,
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.of(context),
      home: SettingsView(),
    );
  }
}
