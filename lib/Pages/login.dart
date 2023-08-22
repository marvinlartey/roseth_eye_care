import 'package:flutter/material.dart';
import 'package:roseth_eye_care/Pages/staff/homepage_staff.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TextField(
              decoration: InputDecoration(labelText: 'Username'),
            ),
            const SizedBox(height: 16.0),
            const TextField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 32.0),
            Row(
              children: [
                SizedBox(
                  width: screenWidth * 0.4,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width *
                      0.5, // Button occupies half the screen width
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const StaffHomePage()));
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 18), // Increase text size
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
