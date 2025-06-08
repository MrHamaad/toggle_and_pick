import 'package:flutter/material.dart';

class ToggleTheme extends StatefulWidget {
  final Function(bool) onThemeChanged;
  const ToggleTheme(this.onThemeChanged,{super.key});

  @override
  State<ToggleTheme> createState() => _ToggleThemeState();
}

class _ToggleThemeState extends State<ToggleTheme> {

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textTheme = Theme.of(context).textTheme;
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

          ],
        ),
      ),
    );
  }
}
