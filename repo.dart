class Repo {
  final String name;
  final String description;
  final String htmlUrl;
  final String language;
  final int stargazersCount;
  final String updatedAt;

  Repo({
    required this.name,
    required this.description,
    required this.htmlUrl,
    required this.language,
    required this.stargazersCount,
    required this.updatedAt,
  });

  factory Repo.fromJson(Map<String, dynamic> j) => Repo(
    name: j['name'] ?? '',
    description: j['description'] ?? '',
    htmlUrl: j['html_url'] ?? '',
    language: j['language'] ?? '—',
    stargazersCount: j['stargazers_count'] ?? 0,
    updatedAt: j['updated_at'] ?? '',
  );
}
