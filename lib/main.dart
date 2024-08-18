import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gemini_gpt/screens/onboarding.dart';
import 'package:gemini_gpt/providers/themeNotifier.dart';
import 'package:gemini_gpt/theme/themes.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  runApp(
      const ProviderScope(child: MyApp())
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightMode,
      darkTheme: darkMode,
      themeMode: themeMode,
      home: const Onboarding(),
      debugShowCheckedModeBanner: false,
    );
  }
}
