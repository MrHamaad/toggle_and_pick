import 'package:flutter/material.dart';

class IconScreen extends StatefulWidget {
  const IconScreen({super.key});

  @override
  State<IconScreen> createState() => _IconScreenState();
}

class _IconScreenState extends State<IconScreen> {
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
    return SafeArea(
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

                  ],
                ),
              ),
            ),

            // Footer fixed at bottom

          ],
        ),
      ),
    );
  }
}
