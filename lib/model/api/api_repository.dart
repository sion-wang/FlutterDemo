import 'dart:convert';

import 'package:gql/language.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_demo/model/api/api_result.dart';
import 'package:flutter_demo/model/api/logging_interceptor.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_client_with_interceptor.dart';
import 'package:flutter_demo/model/api/graphql/queries/viewer.dart' as queries;

import 'bean/user/user.dart';

// to run the example, replace <YOUR_PERSONAL_ACCESS_TOKEN> with your GitHub token
const String YOUR_PERSONAL_ACCESS_TOKEN =
    '264797bfefe5a3f44ac6b78ed98464d8a950ef40';

class ApiRepository {
  String baseUrl;
  Client httpClient = HttpClientWithInterceptor.build(
      interceptors: [LoggingInterceptor()],
      requestTimeout: Duration(seconds: 30));
  late GraphQLClient qlClient;

  ApiRepository({required this.baseUrl}) {
    qlClient = _initGraphQLClient();
  }

  GraphQLClient _initGraphQLClient() {
    final HttpLink _httpLink = HttpLink(
      'https://api.github.com/graphql',
    );

    final AuthLink _authLink = AuthLink(
      getToken: () => 'Bearer $YOUR_PERSONAL_ACCESS_TOKEN',
    );

    final Link _link = _authLink.concat(_httpLink);

    return GraphQLClient(
      cache: GraphQLCache(
        store: HiveStore(),
      ),
      link: _link,
    );
  }

  Future<ApiResult<List<User>>> fetchUsers(
      {int since = 0, int perPage = 20}) async {
    try {
      final response = await httpClient.get(
        Uri.https(baseUrl, "/users", {
          'since': since.toString(),
          'per_page': perPage.toString(),
        }),
        headers: {"Accept": "application/vnd.github.v3+json"},
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List;
        List<User> users = data.map((rawData) {
          return User.fromJson(rawData);
        }).toList();
        return ApiResult.success(users);
      } else {
        return ApiResult.error(Exception(response.body));
      }
    } catch (error) {
      debugPrint('fetchUsers error: ${error.toString()}');
      return ApiResult.error(error);
    }
  }

  Future<QueryResult> getMe() async {
    final WatchQueryOptions options = WatchQueryOptions(
        document: parseString(queries.getMe), fetchResults: true);
    return await qlClient.query(options);
  }
}
