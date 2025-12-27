import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();
  @override
  List<Object?> get props => [];
}

class CounterIncremented extends CounterEvent {
  const CounterIncremented();
}

class CounterDecremented extends CounterEvent {
  const CounterDecremented();
}

class CounterReset extends CounterEvent {
  const CounterReset();
}

class CounterSetValue extends CounterEvent {
  final int value;
  const CounterSetValue(this.value);
  @override
  List<Object?> get props => [value];
}
