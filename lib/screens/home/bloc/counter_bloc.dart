import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<CounterPlusButtonClickedEvent>((event, emit) {
      emit(CounterIncrementState(state.counter + 1));
    });
    on<CounterMinusButtonClickedEvent>(
        (event, emit) => emit(CounterDecrementState(state.counter - 1)));
    on<CounterResetButtonClickedEvent>(
        (event, emit) => emit(CounterResetState(state.counter = 0)));
  }
}
