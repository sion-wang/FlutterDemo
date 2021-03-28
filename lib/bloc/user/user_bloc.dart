import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/bloc/user/user_event.dart';
import 'package:flutter_demo/bloc/user/user_state.dart';
import 'package:flutter_demo/model/api/api_repository.dart';
import 'package:flutter_demo/model/api/api_result.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final ApiRepository apiRepository;

  UserBloc({@required this.apiRepository}) : super(UserInitState());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if(event is UserFetchEvent) {
      final result = await apiRepository.fetchUsers(since: event.pageKey);
      if(result is Success) {
        yield UserLoadedState((result as Success).data, event.pageKey);
      } else {
        yield UserFetchFailState((result as Error).exception);
      }
      return;
    } else {

    }
  }

}