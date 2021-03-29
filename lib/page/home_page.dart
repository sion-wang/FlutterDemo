import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/bloc/home/home_bloc.dart';
import 'package:flutter_demo/bloc/home/home_event.dart';
import 'package:flutter_demo/bloc/home/home_state.dart';
import 'package:flutter_demo/page/mine_page.dart';
import 'package:flutter_demo/page/user_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeBloc _homeBloc;

  int _selectedBottomNavigationIndex = 0;

  final List<_BottomNavigationItem> _bottomNavigationItems = [
    _BottomNavigationItem(
      label: 'User',
      iconData: Icons.accessibility,
      widgetBuilder: (context) => UserPage(),
    ),
    _BottomNavigationItem(
      label: 'Mine',
      iconData: Icons.info_outline,
      widgetBuilder: (context) => MinePage(),
    ),
  ];

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
        return Scaffold(
          appBar: AppBar(
            title: Text('Flutter Demo'),
          ),
          resizeToAvoidBottomInset: false,
          bottomNavigationBar: _buildBtmNavBar(),
          body: _buildBody(),
        );
      },
    );
  }

  Widget _buildBtmNavBar() {
    return BottomNavigationBar(
      currentIndex: _selectedBottomNavigationIndex,
      items: _bottomNavigationItems
          .map(
            (item) => BottomNavigationBarItem(
          icon: Icon(item.iconData),
          label: item.label,
        ),
      )
          .toList(),
      onTap: (newIndex) => setState(
            () => _selectedBottomNavigationIndex = newIndex,
      ),
    );
  }

  Widget _buildBody() {
    return IndexedStack(
      index: _selectedBottomNavigationIndex,
      children: _bottomNavigationItems
          .map(
            (item) => item.widgetBuilder(context),
      )
          .toList(),
    );
  }
}

class _BottomNavigationItem {
  const _BottomNavigationItem({
    required this.label,
    required this.iconData,
    required this.widgetBuilder,
  });

  final String label;
  final IconData iconData;
  final WidgetBuilder widgetBuilder;
}
