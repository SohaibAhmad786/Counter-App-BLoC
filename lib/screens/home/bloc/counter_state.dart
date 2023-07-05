part of 'counter_bloc.dart';

abstract class CounterState {
  int counter = 0;
  CounterState({required this.counter});
}

class CounterInitial extends CounterState {
  CounterInitial() : super(counter: 0);
}

class CounterIncrementState extends CounterState {
  CounterIncrementState(int counterIncrement)
      : super(counter: counterIncrement);
}

class CounterDecrementState extends CounterState {
  CounterDecrementState(int counterDecrement)
      : super(counter: counterDecrement);
}

class CounterResetState extends CounterState {
  CounterResetState(int counterReset):super(counter: counterReset);
}
