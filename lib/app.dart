import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'home_scaffold.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // This must remain 'const' for testing

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Theme & Icon Picker',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const HomeScaffold(),
    );
  }
}
