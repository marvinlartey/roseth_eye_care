import 'package:flutter/material.dart';
import 'package:roseth_eye_care/Pages/staff/list_of_patients.dart';
import 'package:roseth_eye_care/Pages/staff/new_patient.dart';

class StaffHomePage extends StatelessWidget {
  const StaffHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double screenWidth = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: const Color.fromARGB(255, 44, 122, 211),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(children: [
            // User info bar
            const Card(
              child: Row(children: [Text("hellooo")]),
            ),

            const Padding(padding: EdgeInsets.all(50)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // New patient button

                MainButton(
                  icon: Icons.person_add,
                  text: 'New Patient',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NewPatient()));
                  },
                ),
                // Search with ID
                MainButton(
                  icon: Icons.person_search_rounded,
                  text: 'Search with ID Number',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NewPatient()));
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Search with name
                MainButton(
                  icon: Icons.badge_outlined,
                  text: 'Search with name',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NewPatient()));
                  },
                ),

                // Update Details
                MainButton(
                  icon: Icons.edit_square,
                  text: 'Update Details',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PatientList()));
                  },
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

class MainButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;
  const MainButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: InkWell(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: const Color.fromARGB(255, 38, 123, 219),
            width: screenWidth * 0.36,
            height: screenHeight * 0.20,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: Colors.white,
                    size: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
