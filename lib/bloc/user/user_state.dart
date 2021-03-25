import 'package:equatable/equatable.dart';
import 'package:flutter_demo/model/api/bean/user/user.dart';

abstract class UserState extends Equatable {
  @override
  List<Object> get props => [];
}

class UserInitState extends UserState {}

class UserLoadedState extends UserState {
  final List<User> users;

  UserLoadedState(this.users);

  @override
  List<Object> get props => [users,];
}