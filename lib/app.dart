import 'package:flutter/material.dart';

import 'core/app_theme.dart';
import 'providers/app_provider.dart';
import 'views/home_screen.dart';
import 'package:provider/provider.dart';

class NovaMartApp extends StatelessWidget {
  const NovaMartApp({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NovaMart',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode:
          provider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: const HomeScreen(),
    );
  }
}