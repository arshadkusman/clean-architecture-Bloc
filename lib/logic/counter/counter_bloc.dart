import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterValue(value: 0)) {
    on<IncrementEvent>(_onIncrement);
    on<DecrementEvent>(_onDecrement);
  }

  void _onIncrement(IncrementEvent event, Emitter<CounterState> emit) {
    final currentValue =
        state is CounterValue ? (state as CounterValue).value : 0;
    emit(CounterStatus(message: "Incrementing"));
    emit(CounterValue(value: currentValue + 1));
  }

  void _onDecrement(DecrementEvent event, Emitter<CounterState> emit) {
    final currentValue =
        state is CounterValue ? (state as CounterValue).value : 0;
    emit(CounterStatus(message: "Decrementing"));
    emit(CounterValue(value: currentValue - 1));
  }
}
