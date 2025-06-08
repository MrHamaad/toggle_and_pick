import 'package:flutter/material.dart';
import 'theme/app_theme.dart'; // import only once here
import 'screens/home_screen.dart'; // make sure this is imported
import 'screens/icon_screen.dart';
import 'screens/toggle_theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});  // add key

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;
  int _selectedIndex = 0;
  void _toggleTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {

    final List<Widget> _widgetOptions = <Widget>[
      const HomeScreen(),
      IconScreen(),
      ToggleTheme(_toggleTheme),
    ];
    return MaterialApp(
      title: 'Theme & Icon Picker',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _themeMode,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Icon Picker & Theme Toggle',),
        ),
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
            items:const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.grid_view),
                label: 'Icons',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.brightness_6),
                label: 'Themes',
              ),

            ] ,
             currentIndex: _selectedIndex,
             selectedItemColor: Colors.amber[800],
             onTap: _onItemTapped,
      ), //
    ));
  }
}
