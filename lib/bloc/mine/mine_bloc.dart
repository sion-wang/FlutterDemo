import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/bloc/mine/mine_event.dart';
import 'package:flutter_demo/bloc/mine/mine_state.dart';
import 'package:flutter_demo/model/api/api_repository.dart';

class MineBloc extends Bloc<MineEvent, MineState> {
  final ApiRepository apiRepository;

  MineBloc({required this.apiRepository}) : super(MineInitState());

  @override
  Stream<MineState> mapEventToState(MineEvent event) async* {
    if(event is MineFetchEvent) {
      return;
    } else {

    }
  }

}