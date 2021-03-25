import 'package:equatable/equatable.dart';

abstract class MineEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class MineFetchEvent extends MineEvent {}