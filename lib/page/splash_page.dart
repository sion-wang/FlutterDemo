import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_demo/bloc/splash/splash_bloc.dart';
import 'package:flutter_demo/bloc/splash/splash_event.dart';
import 'package:flutter_demo/bloc/splash/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/model/api/api_repository.dart';
import 'package:flutter_demo/model/api/bean/config_data.dart';
import 'package:flutter_demo/model/config_provider.dart';
import 'package:flutter_demo/page/home_page.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  SplashBloc _splashBloc;

  @override
  void initState() {
    super.initState();
    _splashBloc = BlocProvider.of<SplashBloc>(context);
    _splashBloc.add(SplashFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    ConfigData _configData = ConfigProvider.of(context).data;
    return BlocBuilder<SplashBloc, SplashState>(builder: (context, state) {
      debugPrint('build: $state');
      if (state is SplashLoadedState) {
        debugPrint('@@${state.users}');
      }
      return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
            child: IconButton(
          icon: Icon(
            Icons.bathtub,
            color: Colors.pinkAccent,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext pageContext) => HomePage()));
          },
        )),
      );
    });
  }
}
