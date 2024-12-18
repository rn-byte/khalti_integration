import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:khalti_integration/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return KhaltiScope(
      publicKey: 'test_public_key_41af29871a6e46a2817eac518f72514e',
      enabledDebugging: true,
      builder: (context, navKey) => MaterialApp(
        navigatorKey: navKey,
        localizationsDelegates: const [KhaltiLocalizations.delegate],
        title: 'Khalti Integration Demo',
        darkTheme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const DashboardScreen(),
      ),
    );
  }
}
