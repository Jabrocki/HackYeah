import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'post.dart';

import 'failure_model.dart';

class PostRepository {
  static const String _baseUrl = 'https://api.notion.com/v1/';

  final http.Client _client;

  PostRepository({http.Client? client}) : _client = client ?? http.Client();

  void dispose() {
    _client.close();
  }

  Future<List<Post>> getItems() async {
    try {
      final url = '${_baseUrl}databases/${dotenv.env['NOTION_POSTS_ID']}/query';
      final response = await _client.post(Uri.parse(url), headers: {
        HttpHeaders.authorizationHeader:
            'Bearer ${dotenv.env['NOTION_API_KEY']}',
        'Notion-Version': '2022-06-28'
      });

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        return (data['results'] as List).map((e) => Post.fromMap(e)).toList();
      } else {
        throw const Failure(message: 'Something went wrong!');
      }
    } catch (_) {
      throw const Failure(message: 'Something went wrong!');
    }
  }
}

class ProfileRepository {
  static const String _baseUrl = 'https://api.notion.com/v1/';

  final http.Client _client;

  ProfileRepository({http.Client? client}) : _client = client ?? http.Client();

  void dispose() {
    _client.close();
  }

  Future<List<User>> getItems() async {
    try {
      final url = '${_baseUrl}databases/${dotenv.env['NOTION_USERS_ID']}/query';
      final response = await _client.post(Uri.parse(url), headers: {
        HttpHeaders.authorizationHeader:
            'Bearer ${dotenv.env['NOTION_API_KEY']}',
        'Notion-Version': '2022-06-28'
      });

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        return (data['results'] as List).map((e) => User.fromMap(e)).toList();
      } else {
        throw const Failure(message: 'Something went wrong!');
      }
    } catch (_) {
      throw const Failure(message: 'Something went wrong!');
    }
  }
}

