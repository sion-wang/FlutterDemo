import 'package:equatable/equatable.dart';
import 'package:flutter_demo/model/api/bean/user/user.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitState extends HomeState {}

class HomeLoadedState extends HomeState {
  final List<User> users;

  HomeLoadedState(this.users);

  @override
  List<Object> get props => [users,];
}