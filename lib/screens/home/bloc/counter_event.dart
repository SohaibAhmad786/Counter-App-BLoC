part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

class CounterPlusButtonClickedEvent extends CounterEvent {}

class CounterMinusButtonClickedEvent extends CounterEvent {}

class CounterResetButtonClickedEvent extends CounterEvent {}
