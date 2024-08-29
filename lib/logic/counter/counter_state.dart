part of 'counter_bloc.dart';

abstract class CounterState {}

class CounterValue extends CounterState {
  final int value;
  CounterValue({required this.value});
}

class CounterStatus extends CounterState {
  final String message;
  CounterStatus({required this.message});
}
