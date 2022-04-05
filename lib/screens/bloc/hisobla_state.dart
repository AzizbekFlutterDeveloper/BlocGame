part of 'hisobla_bloc.dart';

@immutable
abstract class HisoblaState {}

class HisoblaInitial extends HisoblaState {}

class CounterState extends HisoblaState{
  CounterState();
}

class TimerState extends HisoblaState{
  TimerState();
}
