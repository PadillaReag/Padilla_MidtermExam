import 'package:flutter/material.dart';
import 'package:padilla_portfolio/lib/lib/models/repo.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetailScreen extends StatelessWidget {
  final Repo repo;
  const ProjectDetailScreen({super.key, required this.repo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(repo.name)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              repo.description.isEmpty ? 'No description' : repo.description,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Text('Language: ${repo.language}'),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () => launchUrl(
                Uri.parse(repo.htmlUrl),
                mode: LaunchMode.externalApplication,
              ),
              child: const Text('Open on GitHub'),
            ),
          ],
        ),
      ),
    );
  }
}
