import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/bloc/mine/mine_event.dart';
import 'package:flutter_demo/bloc/mine/mine_state.dart';
import 'package:flutter_demo/model/api/api_repository.dart';
import 'package:flutter_demo/model/api/bean/me/me.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class MineBloc extends Bloc<MineEvent, MineState> {
  final ApiRepository apiRepository;

  MineBloc({required this.apiRepository}) : super(MineInitState());

  @override
  Stream<MineState> mapEventToState(MineEvent event) async* {
    if(event is MineFetchEvent) {
      QueryResult result = await apiRepository.getMe();
      if(result.hasException) {
        yield MineFetchFailState(result.exception);
      } else {
        Me me = Me.fromJson(result.data!['viewer']);
        yield MineLoadedState(me);
      }
    } else {

    }
  }

}