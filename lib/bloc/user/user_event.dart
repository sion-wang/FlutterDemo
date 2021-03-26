import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {}

class UserFetchEvent extends UserEvent {
  final int pageKey;

  UserFetchEvent(this.pageKey,);

  @override
  List<Object> get props => [pageKey,];
}