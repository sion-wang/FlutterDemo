
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'following.g.dart';

@JsonSerializable()
class Following extends Equatable {
  @JsonKey(name: 'totalCount')
  final int totalCount;

  const Following({this.totalCount = 0});

  @override
  List<Object?> get props => [totalCount];

  @override
  String toString() {
    return 'Following{totalCount: $totalCount}';
  }

  factory Following.fromJson(Map<String, dynamic> json) => _$FollowingFromJson(json);

  Map<String, dynamic> toJson() => _$FollowingToJson(this);
}