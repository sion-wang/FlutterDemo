
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

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

  const Me({this.login = "", this.name = "", this.email = "", this.createdAt = "", this.avatarUrl = ""});

  @override
  List<Object> get props => [login];

  @override
  String toString() {
    return 'Me{login: $login, name: $name, email: $email, createdAt: $createdAt, avatarUrl: $avatarUrl}';
  }

  factory Me.fromJson(Map<String, dynamic> json) => _$MeFromJson(json);

  Map<String, dynamic> toJson() => _$MeToJson(this);
}