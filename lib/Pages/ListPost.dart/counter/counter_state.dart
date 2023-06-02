part of 'counter_cubit.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {
  CounterInitial();
}

class CounterFinal extends CounterState {
  CounterFinal();
}

class Counter extends CounterState {
  Counter();
}

class CounterLoading extends CounterState {
  CounterLoading();
}
