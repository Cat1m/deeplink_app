import 'package:deeplink_app/green.dart';
import 'package:deeplink_app/red.dart';
import 'package:deeplink_app/services/context_utility.dart';
import 'package:deeplink_app/services/uni_services.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UniServices.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: ContextUtility.navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (_) => const InitialScreen(),
        '/green': (_) => const GreenScreen(),
        '/red': (_) => const RedScreen(),
      },
    );
  }
}

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }
}
