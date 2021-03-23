import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/bloc/home/home_bloc.dart';
import 'package:flutter_demo/bloc/home/home_event.dart';
import 'package:flutter_demo/bloc/home/home_state.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    _homeBloc = BlocProvider.of<HomeBloc>(context);
    _homeBloc.add(HomeFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        debugPrint('state: $state');
        if(state is HomeLoadedState) {
          debugPrint('users: ${state.users}');
        } else {

        }
        return Center(
          child: Text('HomePage'),
        );
      },
    );
  }
}
