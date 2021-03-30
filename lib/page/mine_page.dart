import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/bloc/mine/mine_bloc.dart';
import 'package:flutter_demo/bloc/mine/mine_event.dart';
import 'package:flutter_demo/bloc/mine/mine_state.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  late MineBloc _mineBloc;

  @override
  void initState() {
    _mineBloc = BlocProvider.of<MineBloc>(context);
    _mineBloc.add(MineFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MineBloc, MineState>(builder: (context, state) {
      if (state is MineLoadedState) {
        return Center(child: ClipOval(
          child: Image.network(state.me.avatarUrl),
        ),);
      } else if (state is MineFetchFailState) {
        return Center(child: Text(state.error.toString()),);
      } else {
        return Center(child: CircularProgressIndicator(),);
      }
    });
  }
}
