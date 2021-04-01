import 'package:equatable/equatable.dart';
import 'package:flutter_demo/model/api/bean/followers/followers.dart';
import 'package:flutter_demo/model/api/bean/following/following.dart';
import 'package:flutter_demo/model/api/bean/me/me.dart';
import 'package:flutter_demo/model/api/bean/starred/starred_repo.dart';

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