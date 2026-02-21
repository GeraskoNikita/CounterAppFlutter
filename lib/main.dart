import 'package:counter_app/CounterScreen.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'CounterBloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // 1. Светлая тема
      theme: ThemeData(
        useMaterial3: true,

        colorScheme: ColorScheme.fromSeed(
          seedColor: FlexColor.goldDarkSecondary,
          brightness: Brightness.dark,
        ),

        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontSize: 52, color: Colors.white),
          bodyLarge: TextStyle(fontSize: 16, color: Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            fixedSize: Size(100, 50),
            backgroundColor: FlexColor.goldLightPrimary,
          ),
        ),
      ),

      // 2. Темная тема
      darkTheme: ThemeData(
        useMaterial3: true,

        colorScheme: ColorScheme.fromSeed(
          seedColor: FlexColor.goldDarkPrimary,
          brightness: Brightness.dark,
        ),

        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            // color: Colors.brown,
          ),
          bodyMedium: TextStyle(fontSize: 52, color: Colors.white),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            fixedSize: Size(100, 50),
            backgroundColor: FlexColor.goldLightPrimary,
          ),
        ),
      ),

      // Автоматическое переключение темы в зависимости от настроек системы
      themeMode: ThemeMode.system,

      home: BlocProvider(
        // Создаем экземпляр Bloc и даем к нему доступ дочерним виджетам
        create: (_) => CounterBloc(),
        child: CounterScreen(),
      ),
    );
  }
}
