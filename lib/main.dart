import 'package:counter_app/CounterScreen.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'CounterBloc.dart';

void main() => runApp(const CounterApp());

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  // Выносим общие настройки в отдельный метод, чтобы не повторяться
  ThemeData _buildTheme(Brightness brightness, Color seedColor) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: seedColor, brightness: brightness),
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(fontSize: 52, color: Colors.white),
        bodyLarge: TextStyle(fontSize: 16, color: Colors.white),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(100, 50),
          backgroundColor: FlexColor.goldLightPrimary,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: _buildTheme(Brightness.light, FlexColor.goldDarkSecondary),
      darkTheme: _buildTheme(Brightness.dark, FlexColor.goldDarkPrimary),
      themeMode: ThemeMode.system,
      home: BlocProvider(
        create: (_) => CounterBloc(),
        child: const CounterScreen(),
      ),
    );
  }
}