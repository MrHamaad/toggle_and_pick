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
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Choose an Icon',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // Styled Dropdown
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<IconData>(
                  value: _selectedIcon,
                  isExpanded: true,
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
                          Icon(entry.value, color: primaryColor),
                          const SizedBox(width: 8),
                          Text(entry.key),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),

            const SizedBox(height: 40),

            // Display selected icon in a card
            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Icon(
                  _selectedIcon,
                  size: 100,
                  color: primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
