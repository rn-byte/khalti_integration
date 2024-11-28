import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Method Integration'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            // color: Color.fromARGB(255, 1, 27, 70),
            ),
        child: Column(
          children: [
            ListTile(
              title: const Text('Product 1'),
              subtitle: const Text('Rs. 10'),
              trailing:
                  ElevatedButton(onPressed: () {}, child: const Text('Buy')),
            ),
          ],
        ),
      ),
    );
  }
}
