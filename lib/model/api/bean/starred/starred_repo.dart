
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'starred_repo.g.dart';

@JsonSerializable()
class StarredRepo extends Equatable {
  @JsonKey(name: 'totalCount')
  final int totalCount;

  const StarredRepo({this.totalCount = 0});

  @override
  List<Object?> get props => [totalCount];

  @override
  String toString() {
    return 'StarredRepo{totalCount: $totalCount}';
  }

  factory StarredRepo.fromJson(Map<String, dynamic> json) => _$StarredRepoFromJson(json);

  Map<String, dynamic> toJson() => _$StarredRepoToJson(this);
}