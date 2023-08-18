import 'package:flutter/material.dart';
import 'package:flutter_task/controller/user_controller.dart';

import '../models/user.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  // User model
  late UserData user;

  // fetchUserDetails
  final UserController _userController = UserController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Page'),
      ),
      body: FutureBuilder<UserData>(
        future: _userController.fetchRandomUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No data available'));
          } else {
            final result = snapshot.data!.results[0];
            final registeredDate = DateTime.parse(result.registered.date);
            final now = DateTime.now();
            final daysSinceRegistered = now.difference(registeredDate).inDays;

            return SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(result.picture.large),
                    SizedBox(height: 16),
                    Text(
                        'Name: ${result.name.title} ${result.name.first} ${result.name.last}'),
                    Text(
                        'Location: ${result.location.city}, ${result.location.country}'),
                    Text('Email: ${result.email}'),
                    Text('Date of Birth: ${result.dob.date}'),
                    Text('Days since registered: $daysSinceRegistered days'),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
