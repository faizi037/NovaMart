import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'providers/app_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp();
  } catch (_) {
    // Firebase configuration can be added later.
  }

  runApp(
    ChangeNotifierProvider(
      create: (_) => AppProvider(),
      child: const NovaMartApp(),
    ),
  );
}