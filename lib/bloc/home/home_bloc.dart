import 'package:flutter_demo/bloc/home/home_event.dart';
import 'package:flutter_demo/bloc/home/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/model/api/api_repository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ApiRepository apiRepository;

  HomeBloc({required this.apiRepository}) : super(HomeInitState());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if(event is HomeFetchEvent) {
      yield HomeLoadedState();
      return;
    } else {

    }
  }

}