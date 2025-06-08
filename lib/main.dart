import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: _themeMode,
      home: HomeScreen(onThemeChanged: _toggleTheme),
    );
  }
}

class HomeScreen extends StatefulWidget {
  final Function(bool) onThemeChanged;

  const HomeScreen({super.key, required this.onThemeChanged});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  IconData _selectedIcon = Icons.home;

  final Map<String, IconData> iconOptions = {
    'Home': Icons.home,
    'Star': Icons.star,
    'Favorite': Icons.favorite,
    'Alarm': Icons.alarm,
    'Person': Icons.person,
  };

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text('Icon Picker & Theme Toggle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<IconData>(
              value: _selectedIcon,
              onChanged: (IconData? newIcon) {
                if (newIcon != null) {
                  setState(() {
                    _selectedIcon = newIcon;
                  });
                }
              },
              items: iconOptions.entries.map((entry) {
                return DropdownMenuItem<IconData>(
                  value: entry.value,
                  child: Row(
                    children: [
                      Icon(entry.value),
                      SizedBox(width: 8),
                      Text(entry.key),
                    ],
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 40),
            Icon(
              _selectedIcon,
              size: 100,
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Dark Mode'),
                Switch(
                  value: isDark,
                  onChanged: widget.onThemeChanged,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
