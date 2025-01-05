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
      publicKey: '261a1853c8f546c4aa1108313b46fe7c',
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
