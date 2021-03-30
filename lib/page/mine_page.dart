import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/bloc/mine/mine_bloc.dart';
import 'package:flutter_demo/bloc/mine/mine_event.dart';
import 'package:flutter_demo/bloc/mine/mine_state.dart';
import 'package:flutter_demo/model/api/bean/me/me.dart';

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
        return _buildMe(state.me);
      } else if (state is MineFetchFailState) {
        return Center(
          child: Text(state.error.toString()),
        );
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }

  Widget _buildMe(Me me) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1)),
          ClipOval(child: Image.network(me.avatarUrl, width: 100, height: 100,),),
          Padding(padding: EdgeInsets.only(top: 15)),
          Text(me.login, style: TextStyle(fontSize: 20),),
          Text(me.name, style: TextStyle(color: Colors.black45),),
        ],
      ),
    );
  }
}
