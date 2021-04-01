
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'followers.g.dart';

@JsonSerializable()
class Followers extends Equatable {
  @JsonKey(name: 'totalCount')
  final int totalCount;

  const Followers({this.totalCount = 0});

  @override
  List<Object?> get props => [totalCount];


  @override
  String toString() {
    return 'Followers{totalCount: $totalCount}';
  }

  factory Followers.fromJson(Map<String, dynamic> json) => _$FollowersFromJson(json);

  Map<String, dynamic> toJson() => _$FollowersToJson(this);
}