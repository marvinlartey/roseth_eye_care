import 'package:flutter/material.dart';

class PatientDetailsPage extends StatelessWidget {
  final Map<String, dynamic> patientData; // Patient data to display

  PatientDetailsPage(this.patientData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${patientData['name']}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Age: ${patientData['age']}'),
            const SizedBox(height: 8),
            Text('Gender: ${patientData['gender']}'),
            const SizedBox(height: 8),
            Text('ID Number: ${patientData['idNumber']}'),
            const SizedBox(height: 8),
            Text('Phone Number: ${patientData['phoneNumber']}'),
            const SizedBox(height: 8),
            Text('Next of Kin: ${patientData['nextOfKin']}'),
            const SizedBox(height: 8),
            Text('Next of Kin Phone: ${patientData['nextOfKinPhone']}'),
          ],
        ),
      ),
    );
  }
}
