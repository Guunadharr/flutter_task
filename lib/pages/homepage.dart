import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const platform = const MethodChannel('bluetooth_channel');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter task'),
      ),
      body: Center(
        child: Column(
          children: [
            // Random dog images
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'randomDogImages');
              },
              child: const Text(
                'Random dog images',
              ),
            ),
            // Enable bluetooth
            ElevatedButton(
              onPressed: () async {
                try {
                  await platform.invokeMethod('enableBluetooth');
                } catch (e) {
                  print('Error: $e');
                }
              },
              child: const Text(
                'Enable bluetooth',
              ),
            ),
            // Profile
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'userPage');
              },
              child: const Text(
                'User images',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
