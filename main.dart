// lib/main.dart
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // generated or created manually below
import 'theme.dart';
import 'screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase for the current platform (web / android / etc.)
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vaporwave Portfolio',
      debugShowCheckedModeBanner: false,
      theme: buildVaporwaveTheme(),
      home: const HomeScreen(),
    );
  }
}
