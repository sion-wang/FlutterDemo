
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/bloc/splash/splash_event.dart';
import 'package:flutter_demo/bloc/splash/splash_state.dart';
import 'package:flutter_demo/model/api/bean/user/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final Client httpClient;

  SplashBloc({@required this.httpClient}) : super(SplashInitState());

  @override
  Stream<SplashState> mapEventToState(SplashEvent event) async* {
    if(event is SplashFetchEvent) {
      final users = await _fetchUsers();
      yield SplashLoadedState(users);
      return;
    } else {

    }
  }

  Future<List<User>> _fetchUsers() async {
    final response = await httpClient.get(
      'https://api.github.com/users',
      headers: {"Accept": "application/vnd.github.v3+json"},);
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      return data.map((rawData) {
        return User(
          login: rawData['login'],
          id: rawData['id'],
          nodeId: rawData['node_id'],
          gravatarId: rawData['gravatar_id'],
        );
      }).toList();
    } else {
      throw Exception('error fetching posts');
    }
  }
}