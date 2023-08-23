import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:roseth_eye_care/Pages/staff/parient_details.dart';

class PatientList extends StatefulWidget {
  const PatientList({super.key});

  @override
  State<PatientList> createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient List'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future:
            fetchPatientsFromFirestore(), // Define this function to fetch data
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error fetching data'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No patients available.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> patientData = snapshot.data![index];
                return ListTile(
                  title: Text(patientData['name']),
                  subtitle: Text(
                      'ID: ${patientData['idNumber']}, Age: ${patientData['age']}'),
                  onTap: () {
                    // Navigate to PatientDetailsPage with selected patient data
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PatientDetailsPage(patientData),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }

  Widget _buildPatientList() {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance.collection('patients').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        List<Widget> patientWidgets = [];
        for (var doc in snapshot.data!.docs) {
          Map<String, dynamic> data = doc.data();
          patientWidgets.add(_buildPatientCard(data));
        }

        return ListView(
          padding: const EdgeInsets.all(16.0),
          children: patientWidgets,
        );
      },
    );
  }

  Widget _buildPatientCard(Map<String, dynamic> data) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 16.0),
      child: ListTile(
        title: Text(data['name']),
        subtitle: Text('Age: ${data['age']}, Gender: ${data['gender']}'),
        // Add more patient details as needed
      ),
    );
  }

  Future<List<Map<String, dynamic>>> fetchPatientsFromFirestore() async {
    List<Map<String, dynamic>> patients = [];

    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance.collection('patients').get();

      for (var doc in querySnapshot.docs) {
        patients.add(doc.data());
      }

      return patients;
    } catch (e) {
      print('Error fetching patients: $e');
      return [];
    }
  }
}
