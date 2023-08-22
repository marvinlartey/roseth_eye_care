import 'package:flutter/material.dart';
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
      body: const Padding(
        padding: EdgeInsets.all(18.0),
        child: Column(children: [
          Card(
            child: Row(children: [Text("hellooo")]),
          ),
          Padding(padding: EdgeInsets.all(50)),
          Row(
            children: [
              MainButton(
                icon: Icons.person_add,
                text: 'New Patient',
              ),
              MainButton(
                icon: Icons.person_search_rounded,
                text: 'Search with ID Number',
              ),
            ],
          ),
          Row(
            children: [
              MainButton(
                icon: Icons.badge_outlined,
                text: 'Search with name',
              ),
              MainButton(
                icon: Icons.edit_square,
                text: 'Update Details',
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

class MainButton extends StatelessWidget {
  final String text;
  final IconData icon;
  const MainButton({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const NewPatient()));
        },
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: Card(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                color: const Color.fromARGB(255, 38, 123, 219),
                width: screenWidth * 0.36,
                height: screenHeight * 0.20,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
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
        ),
      ),
    );
  }
}
