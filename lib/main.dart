import 'package:flutter/material.dart';
import 'theme/app_theme.dart'; // import only once here
import 'screens/home_screen.dart'; // make sure this is imported

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});  // add key

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Theme & Icon Picker',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _themeMode,
      home: HomeScreen(onThemeChanged: _toggleTheme), // HomeScreen is recognized now
    );
  }
}
