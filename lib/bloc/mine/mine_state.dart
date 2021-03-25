import 'package:equatable/equatable.dart';

abstract class MineState extends Equatable {
  @override
  List<Object> get props => [];
}

class MineInitState extends MineState {}

class MineLoadedState extends MineState {
  @override
  List<Object> get props => [];
}