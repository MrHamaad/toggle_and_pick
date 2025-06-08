import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Icon Picker & Theme Toggle', style: textTheme.titleMedium),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,  // Space between top content and footer
            children: [
              // Main content centered vertically
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // Wrap content tightly
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
                                const SizedBox(width: 8),
                                Text(entry.key),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 40),
                      Icon(
                        _selectedIcon,
                        size: 100,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Dark Mode', style: textTheme.titleMedium),
                          Switch(
                            value: isDark,
                            onChanged: widget.onThemeChanged,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Footer fixed at bottom
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Developed by Hamaad Majeed '),
                    Icon(Icons.favorite, color: Colors.red),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
