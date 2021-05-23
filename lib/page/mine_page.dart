import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
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
          child: Padding(padding: EdgeInsets.only(left: 20), child: Text(state.error.toString()),),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1)),
          _buildHeader(me),
          _buildInfo(me),
        ],
      ),
    );
  }

  Widget _buildHeader(Me me) {
    return Stack(
      children: [
        Container(height: 250, width: double.infinity),
        Image.asset('assets/github_doc.png',
            height: 200, width: double.infinity, fit: BoxFit.fill),
        Positioned(
          top: 150,
          left: 20,
          child: ClipOval(
              child:
              Image.network(me.avatarUrl, width: 100, height: 100)),
        )
      ],
    );
  }

  Widget _buildInfo(Me me) {
    return Padding(
      padding: EdgeInsets.only(top: 15, left: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            me.name,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text(
            me.login,
            style: TextStyle(fontSize: 15, color: Colors.black45),
          ),
          SizedBox(height: 10),
          Row(children: <Widget>[
            Icon(Icons.group_outlined),
            Text(" " + me.followers.totalCount.toString()),
            Text(' followers · ', style: TextStyle(color: Colors.black45)),
            Text(me.following.totalCount.toString()),
            Text(' following · ', style: TextStyle(color: Colors.black45)),
            Icon(Icons.star_border),
            Text(me.starredRepos.totalCount.toString()),
          ]),
          SizedBox(height: 5),
          Row(children: <Widget>[
            Icon(Icons.email_outlined),
            Text(" " + me.email)
          ]),
        ],
      ),
    );
  }
}
