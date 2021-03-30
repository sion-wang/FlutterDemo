import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/bloc/home/home_bloc.dart';
import 'package:flutter_demo/bloc/mine/mine_bloc.dart';
import 'package:flutter_demo/bloc/user/user_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'bloc/splash/splash_bloc.dart';
import 'model/api/bean/config_data.dart';
import 'model/config_provider.dart';
import 'model/api/api_repository.dart';
import 'page/splash_page.dart';

Future<void> main() async {
  var configProvider = ConfigProvider(
    data: ConfigData(flavor: 'dev', apiBaseUrl: 'api.github.com'),
    child: App(),
  );
  await initHiveForFlutter();
  runApp(configProvider);
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ConfigData? _configData = ConfigProvider.of(context)?.data;

    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
              create: (context) => ApiRepository(baseUrl: _configData?.apiBaseUrl ?? "")),
        ],
        child: MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (context) => SplashBloc(
                      apiRepository:
                          RepositoryProvider.of<ApiRepository>(context))),
              BlocProvider(
                  create: (context) => HomeBloc(
                      apiRepository:
                          RepositoryProvider.of<ApiRepository>(context))),
              BlocProvider(
                  create: (context) => UserBloc(
                      apiRepository:
                          RepositoryProvider.of<ApiRepository>(context))),
              BlocProvider(
                  create: (context) => MineBloc(
                      apiRepository:
                          RepositoryProvider.of<ApiRepository>(context))),
            ],
            child: MaterialApp(
              theme: ThemeData(
                primaryColor: Colors.black,
              ),
              debugShowCheckedModeBanner: false,
              home: SplashPage(),
            )));
  }
}
