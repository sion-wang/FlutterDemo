import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/bloc/user/user_bloc.dart';
import 'package:flutter_demo/bloc/user/user_event.dart';
import 'package:flutter_demo/bloc/user/user_state.dart';

class UserPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  UserBloc _userBloc;

  @override
  void initState() {
    super.initState();
    _userBloc = BlocProvider.of<UserBloc>(context);
    _userBloc.add(UserFetchEvent());
  }

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        debugPrint('state: $state');
        if (state is UserLoadedState) {
          debugPrint('users: ${state.users}');
        } else {}
        return Center(
          child: Text('UserPage'),
        );
      },
    );
  }

}