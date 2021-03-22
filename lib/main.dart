import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/splash/splash_bloc.dart';
import 'model/api/bean/config_data.dart';
import 'model/config_provider.dart';
import 'model/api/api_repository.dart';
import 'page/splash_page.dart';

void main() {
  var configProvider = ConfigProvider(
    data: ConfigData(
      flavor: 'dev',
      apiBaseUrl: 'api.github.com'
    ),
    child: App(),
  );
  runApp(configProvider);
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ConfigData _configData = ConfigProvider.of(context).data;

    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.black,
        ),
        debugShowCheckedModeBanner: false,
        home: MultiRepositoryProvider(
            providers: [
              RepositoryProvider(create: (context) => ApiRepository(_configData.apiBaseUrl)),
            ],
            // create: (context) => ApiProvider('api.github.com'),
            child: MultiBlocProvider(
              providers: [
                BlocProvider(
                    create: (context) => SplashBloc(
                        apiRepository: RepositoryProvider.of<ApiRepository>(context))),
              ],
              child: SplashPage(
                title: "Hello",
              ),
            )));
  }
}