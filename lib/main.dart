import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:roseth_eye_care/Pages/staff/homepage_staff.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StaffHomePage(),
    );
  }
}

void addPatient(
    String name,
    int age,
    String? gender,
    String idNumber,
    String phoneNumber,
    String address,
    String nextOfKin,
    String nextOfKinPhone) {
  FirebaseFirestore.instance.collection('patients').add({
    'name': name,
    'age': age,
    'gender': gender,
    'idNumber': idNumber,
    'phoneNumber': phoneNumber,
    'nextOfKin': nextOfKin,
    'nextOfKinPhone': nextOfKinPhone,
  });
}
