import 'package:flutter/material.dart';
import 'package:flutter_task/pages/random_dog_images.dart';
import 'package:flutter_task/pages/userpage.dart';

import 'pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
      routes: {
        'randomDogImages': (context) => RandomDogImages(),
        'userPage': (context) => UserPage(),
      },
    );
  }
}
