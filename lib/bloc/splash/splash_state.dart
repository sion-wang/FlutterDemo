import 'package:equatable/equatable.dart';
import 'package:flutter_demo/model/api/bean/user/user.dart';

abstract class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

class SplashInitState extends SplashState {}

class SplashLoadedState extends SplashState {}