import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  final int count;
  final bool isEven;
  final String message;
  const CounterState({
    required this.count,
    required this.isEven,
    required this.message,
  });
  factory CounterState.initial() {
    return const CounterState(
      count: 0,
      isEven: true,
      message: 'Counter is at zero',
    );
  }
  CounterState copyWith({int? count, bool? isEven, String? message

  }){
return CounterState(count: count??this.count, isEven: isEven??this.isEven, message: message??this.message);
  }
  @override
  List<Object?> get props => [count, isEven, message];
  @override
  String toString(){
    return "CounterState(count: $count, isEven: $isEven, message: $message)";
  }
}
