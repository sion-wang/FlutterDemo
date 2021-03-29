import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_demo/bloc/splash/splash_bloc.dart';
import 'package:flutter_demo/bloc/splash/splash_event.dart';
import 'package:flutter_demo/bloc/splash/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import 'home_page.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late SplashBloc _splashBloc;

  @override
  void initState() {
    super.initState();
    _splashBloc = BlocProvider.of<SplashBloc>(context);
    _splashBloc.add(SplashFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is SplashLoadedState) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext pageContext) => HomePage()));
        }
      },
      child: BlocBuilder<SplashBloc, SplashState>(builder: (context, state) {
        return Center(
            child: Container(
              height: 150.0,
              width: 150.0,
              child: Lottie.asset('assets/happy.json'),
            ),
        );
      }),);
  }
}
