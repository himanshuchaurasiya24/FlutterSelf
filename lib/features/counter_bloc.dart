import 'package:bloc/bloc.dart';
import 'package:flutterself/features/counter_event.dart';
import 'package:flutterself/features/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial()) {
    on<CounterIncremented>(_onIncremented);
    on<CounterDecremented>(_onDecremented);
    on<CounterReset>(_onReset);
    on<CounterSetValue>(_onSetValue);
  }
  void _onDecremented(CounterDecremented event, Emitter<CounterState> emit) {
    final newCount = state.count - 1;
    emit(_createState(newCount));
  }

  void _onIncremented(CounterIncremented event, Emitter<CounterState> emit) {
    final newCount = state.count + 1;
    emit(_createState(newCount));
  }

  void _onReset(CounterReset event, Emitter<CounterState> emit) {
    final newCount = 0;
    emit(_createState(newCount));
  }

  void _onSetValue(CounterSetValue event, Emitter<CounterState> emit) {
    final newCount = event.value;
    emit(_createState(newCount));
  }

  CounterState _createState(int count) {
    final isEven = count % 2 == 0 ? true : false;
    final message = _generateMessage(count, isEven);
    return CounterState(count: count, isEven: isEven, message: message);
  }

  String _generateMessage(int count, bool isEven) {
    if (count == 0) {
      return "Counter is at Zero!";
    }
    if (count < 0) {
      return "Counter is Negative!";
    }
    if (count > 100) {
      return "Counter is greater than 100!";
    }
    if (isEven) {
      return "Counter is Even!";
    }
    return "Counter is Odd!";
  }
}
