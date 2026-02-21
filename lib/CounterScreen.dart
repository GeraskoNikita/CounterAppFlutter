
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'CounterBloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterscreenState();
}

class _CounterscreenState extends State<CounterScreen> {


@override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    // 3. Используем данные темы в коде виджетов
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    context.read<CounterBloc>().add(SaveValueEvent());


    return  Scaffold(
        appBar: AppBar(
          title: Text('Counter App'),
          centerTitle: true,

          // Цвет AppBar берется из схемы автоматически
          backgroundColor: colorScheme.inversePrimary,
        ),
        body: BlocBuilder<CounterBloc, int>(
          builder: (context, count) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(50, 250, 50, 0),
                child: Column(
                  children: [
                    Text(count.toString(), style: theme.textTheme.bodyMedium),
                    SizedBox(height: 80),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {context.read<CounterBloc>().add(IncrementEvent());},
                          child: Text("+", style: theme.textTheme.displayLarge),
                          style: theme.elevatedButtonTheme.style,
                        ),
                        Spacer(),

                        ElevatedButton(
                          onPressed: () {context.read<CounterBloc>().add(DecrementEvent());},
                          child: Text("-", style: theme.textTheme.displayLarge),
                          style: theme.elevatedButtonTheme.style,
                        ),
                      ],
                    ),

                    SizedBox(height: 80),
                    ElevatedButton(
                      onPressed: () {context.read<CounterBloc>().add(ResetEvent());},
                      child: Text("Reset", style: theme.textTheme.bodyLarge),
                      style: theme.elevatedButtonTheme.style,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
  }
}
