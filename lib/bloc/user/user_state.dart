import 'package:equatable/equatable.dart';
import 'package:flutter_demo/model/api/bean/user/user.dart';

abstract class UserState extends Equatable {
  @override
  List<Object> get props => [];
}

class UserInitState extends UserState {}

class UserLoadedState extends UserState {
  final List<User> users;
  final int pageKey;

  UserLoadedState(this.users, this.pageKey);

  @override
  List<Object> get props => [users, pageKey];
}

class UserFetchFailState extends UserState {
  final dynamic error;

  UserFetchFailState(this.error);
  
  @override
  List<Object> get props => [error,];
}