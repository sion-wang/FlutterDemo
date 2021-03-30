import 'package:equatable/equatable.dart';
import 'package:flutter_demo/model/api/bean/me/me.dart';

abstract class MineState extends Equatable {
  @override
  List<Object> get props => [];
}

class MineInitState extends MineState {}

class MineLoadedState extends MineState {
  final Me me;

  MineLoadedState(this.me);

  @override
  List<Object> get props => [me];
}

class MineFetchFailState extends MineState {
  final dynamic error;

  MineFetchFailState(this.error);

  @override
  List<Object> get props => [error,];
}