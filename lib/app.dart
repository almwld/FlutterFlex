import 'package:flutter/material.dart';
import 'navigation/main_navigation.dart';
import 'theme/app_theme.dart';

class FlexYemenApp extends StatefulWidget {
  const FlexYemenApp({super.key});

  @override
  State<FlexYemenApp> createState() => _FlexYemenAppState();
}

class _FlexYemenAppState extends State<FlexYemenApp> {
  bool isDarkMode = true;
  int cartCount = 0;

  void toggleTheme() => setState(() => isDarkMode = !isDarkMode);
  void addToCart() => setState(() => cartCount++);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flex Yemen',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: MainNavigation(
        isDarkMode: isDarkMode,
        cartCount: cartCount,
        onThemeToggle: toggleTheme,
        onAddToCart: addToCart,
      ),
    );
  }
}
