import 'package:flutter_task/controller/user_controller.dart';
import 'package:flutter_task/models/user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockUserController extends Mock implements UserController {}

void main() {
  group('UserController', () {
    test('fetchUserData returns valid UserData', () async {
      final userController = UserController();
      final userData = await userController.fetchRandomUser();

      expect(userData, isA<UserData>());
      expect(userData.results, isNotEmpty);
    });

    test('fetchUserData handles network error', () async {
      final mockUserController = MockUserController();
      final userController = UserController();

      userController.fetchRandomUser = mockUserController;

      when(mockUserController.fetchRandomUser())
          .thenThrow(Exception('Network error'));

      expect(() async => await userController.fetchRandomUser(),
          throwsA(isA<Exception>));
    });
  });
}
