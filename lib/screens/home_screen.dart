import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Card(
            elevation: 5,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            color: isDark
                ? Theme.of(context).colorScheme.primary.withOpacity(0.15)
                : Colors.amber[100],
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: "Welcome! 👋\n\n",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text:
                      "This app demonstrates a smooth toggle between ",
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).textTheme.bodyMedium!.color,
                      ),
                    ),
                    TextSpan(
                      text: "Light & Dark Themes ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    TextSpan(
                      text: "and a beautiful ",
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).textTheme.bodyMedium!.color,
                      ),
                    ),
                    TextSpan(
                      text: "Icon Picker Dropdown.",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
