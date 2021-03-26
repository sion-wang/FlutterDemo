import 'dart:convert';

import 'package:flutter_demo/model/api/logging_interceptor.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_client_with_interceptor.dart';

import 'bean/user/user.dart';

class ApiRepository {
  String _baseUrl;
  Client httpClient;

  ApiRepository(String baseUrl) {
    _baseUrl = baseUrl;
    httpClient = HttpClientWithInterceptor.build(interceptors: [LoggingInterceptor()]);
  }

  Future<List<User>> fetchUsers({int since = 0, int perPage = 20}) async {
    final response = await httpClient.get(
      Uri.https(_baseUrl, "/users", {'since': since.toString(), 'per_page': perPage.toString(),}),
      headers: {"Accept": "application/vnd.github.v3+json"},);
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      return data.map((rawData) {
        return User(
          login: rawData['login'],
          id: rawData['id'],
          nodeId: rawData['node_id'],
          gravatarId: rawData['gravatar_id'],
        );
      }).toList();
    } else {
      throw Exception('error fetching posts');
    }
  }
}