import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
      body: _buildPatientList(),
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
}
