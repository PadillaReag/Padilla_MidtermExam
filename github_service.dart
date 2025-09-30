import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:padilla_portfolio/lib/lib/models/repo.dart';

class GithubService {
  final String username;
  GithubService(this.username);

  Future<List<Repo>> fetchRecentRepos({int perPage = 6}) async {
    final uri = Uri.parse(
      'https://api.github.com/users/$username/repos?sort=updated&per_page=$perPage',
    );
    final res = await http.get(
      uri,
      headers: {'Accept': 'application/vnd.github+json'},
    );
    if (res.statusCode == 200) {
      final List data = jsonDecode(res.body);
      return data.map((e) => Repo.fromJson(e)).toList();
    }
    throw Exception('GitHub error: ${res.statusCode}');
  }

  Future<Map<String, dynamic>> fetchProfile() async {
    final uri = Uri.parse('https://api.github.com/users/$username');
    final res = await http.get(
      uri,
      headers: {'Accept': 'application/vnd.github+json'},
    );
    if (res.statusCode == 200) {
      return jsonDecode(res.body) as Map<String, dynamic>;
    }
    throw Exception('GitHub profile error: ${res.statusCode}');
  }
}
