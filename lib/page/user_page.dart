import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/bloc/user/user_bloc.dart';
import 'package:flutter_demo/bloc/user/user_event.dart';
import 'package:flutter_demo/bloc/user/user_state.dart';
import 'package:flutter_demo/model/api/bean/user/user.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class UserPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late UserBloc _userBloc;

  static const _pageSize = 20;
  final PagingController<int, User> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    super.initState();
    _userBloc = BlocProvider.of<UserBloc>(context);
    _pagingController.addPageRequestListener((pageKey) {
      _userBloc.add(UserFetchEvent(pageKey));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserLoadedState) {
          List<User> newItems = state.users;
          final isLastPage = newItems.length < _pageSize;
          if (isLastPage) {
            _pagingController.appendLastPage(newItems);
          } else {
            final nextPageKey = newItems.last.id;
            _pagingController.appendPage(newItems, nextPageKey);
          }
        } else if (state is UserFetchFailState) {
          _pagingController.error = state.error;
        } else {}

        return RefreshIndicator(
          onRefresh: () => Future.sync(
            () => _pagingController.refresh(),
          ),
          child: PagedListView<int, User>.separated(
            pagingController: _pagingController,
            builderDelegate: PagedChildBuilderDelegate<User>(
              itemBuilder: (context, item, index) => UserListItem(
                user: item,
              ),
            ),
            separatorBuilder: (context, index) => const Divider(),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}

class UserListItem extends StatelessWidget {
  const UserListItem({
    required this.user,
    Key? key,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) => ListTile(
        leading: ClipOval(
          child: Image.network(user.avatarUrl),
        ),
        title: Text(user.login),
        subtitle: Text(user.type),
      );
}
