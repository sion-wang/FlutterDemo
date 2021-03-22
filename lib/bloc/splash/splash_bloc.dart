import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/bloc/splash/splash_event.dart';
import 'package:flutter_demo/bloc/splash/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/model/api/api_repository.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final ApiRepository apiRepository;

  SplashBloc({@required this.apiRepository}) : super(SplashInitState());

  // @override
  // Stream<Transition<SplashEvent, SplashState>> transformEvents(
  //     Stream<SplashEvent> events,
  //     TransitionFunction<SplashEvent, SplashState> transitionFn,
  //     ) {
  //   return super.transformEvents(
  //     events.distinct(const Duration(milliseconds: 500)),
  //     transitionFn,
  //   );
  // }

  @override
  Stream<SplashState> mapEventToState(SplashEvent event) async* {
    if(event is SplashFetchEvent) {
      final users = await apiRepository.fetchUsers();
      yield SplashLoadedState(users);
      return;
    } else {

    }
  }

}