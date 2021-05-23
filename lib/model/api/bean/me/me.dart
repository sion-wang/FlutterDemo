
import 'package:equatable/equatable.dart';
import 'package:flutter_demo/model/api/bean/followers/followers.dart';
import 'package:flutter_demo/model/api/bean/following/following.dart';
import 'package:flutter_demo/model/api/bean/starred/starred_repo.dart';
import 'package:json_annotation/json_annotation.dart';

///run "flutter pub run build_runner build" to generate me.g.dart
part 'me.g.dart';

///   {
///       "login": "sion-wang",
///       "name": "Sion",
///       "email": "sion044927@gmail.com",
///       "createdAt": "2015-01-13T02:53:00Z",
///       "avatarUrl": "https://avatars.githubusercontent.com/u/10509101?u=1de3e2077bbdcbd9a190b4e386462f00ef28df36&v=4",
///       "followers": {
///         "totalCount": 2
///       },
///       "following": {
///         "totalCount": 1
///       },
///       "starredRepositories": {
///         "totalCount": 21
///       },
///       "status": {
///         "emoji": ":grinning:",
///         "message": null
///       }
///   }

@JsonSerializable()
class Me extends Equatable {
  @JsonKey(name:'login')
  final String login;
  @JsonKey(name:'name')
  final String name;
  @JsonKey(name:'email')
  final String email;
  @JsonKey(name:'createdAt')
  final String createdAt;
  @JsonKey(name:'avatarUrl')
  final String avatarUrl;
  @JsonKey(name: 'followers')
  final Followers followers;
  @JsonKey(name: 'following')
  final Following following;
  @JsonKey(name: 'starredRepositories')
  final StarredRepo starredRepos;

  const Me({
    this.login = "",
    this.name = "",
    this.email = "",
    this.createdAt = "",
    this.avatarUrl = "",
    this.followers = const Followers(),
    this.following = const Following(),
    this.starredRepos = const StarredRepo(),
  });

  @override
  List<Object> get props => [login];


  @override
  String toString() {
    return 'Me{login: $login, name: $name, email: $email, createdAt: $createdAt, avatarUrl: $avatarUrl, followers: $followers, following: $following, starredRepos: $starredRepos}';
  }

  factory Me.fromJson(Map<String, dynamic> json) => _$MeFromJson(json);

  Map<String, dynamic> toJson() => _$MeToJson(this);
}