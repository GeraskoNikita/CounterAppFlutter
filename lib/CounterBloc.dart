import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

// --- СОБЫТИЯ (Events) ---
abstract class CounterEvent {}

class IncrementEvent extends CounterEvent {}

class DecrementEvent extends CounterEvent {}

class ResetEvent extends CounterEvent {}

class SaveValueEvent extends CounterEvent {}

// --- BLOC ---
class CounterBloc extends Bloc<CounterEvent, int> {
  final prefs = SharedPreferences.getInstance();

  CounterBloc() : super(0) {
    on<IncrementEvent>((event, emit) {
      emit(this.state + 1);
      prefs.then((prefs) {
        prefs.setInt('counter', this.state);
      });
    });

    on<DecrementEvent>((event, emit) {
      emit(this.state - 1);
      prefs.then((prefs) {
        prefs.setInt('counter', this.state);
      });
    });

    on<SaveValueEvent>((event, emit) {
      prefs.then((prefs) {
        emit(prefs.getInt('counter') ?? 0);
      });
    });

    on<ResetEvent>((event, emit) {
      emit(0);
      prefs.then((prefs) {
        prefs.setInt('counter', 0);
      });
    });
  }
}
