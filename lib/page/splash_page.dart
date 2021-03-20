import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_demo/bloc/splash/splash_bloc.dart';
import 'package:flutter_demo/bloc/splash/splash_event.dart';
import 'package:flutter_demo/bloc/splash/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return BlocBuilder<SplashBloc, SplashState>(builder: (context, state) {
      debugPrint('build: $state');
      if(state is SplashLoadedState) {
        debugPrint('@@${state.users}');
      }
      return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Center(
          child: Text("splash"),
        ),
      );
    });
  }
}
