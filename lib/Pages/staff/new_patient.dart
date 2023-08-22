import 'package:flutter/material.dart';
import 'package:roseth_eye_care/Pages/staff/homepage_staff.dart';

import '../../main.dart';

// TODO: CATCH WRONG DATA TYPES

class NewPatient extends StatefulWidget {
  const NewPatient({super.key});

  @override
  State<NewPatient> createState() => _NewPatientState();
}

class _NewPatientState extends State<NewPatient> {
  String? selectedGender = '';
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _idNumberController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _nextOfKinController = TextEditingController();
  final TextEditingController _nextOfKinPhoneController =
      TextEditingController();

  final _ageFocusNode = FocusNode();
  final _addressFocusNode = FocusNode();
  final _genderFocusNode = FocusNode();
  final _idNumberFocusNode = FocusNode();
  final _phoneNumberFocusNode = FocusNode();
  final _nextOfKinFocusNode = FocusNode();
  final _nextOfKinPhoneFocusNode = FocusNode();

  @override
  void dispose() {
    _ageFocusNode.dispose();
    _genderFocusNode.dispose();
    _addressFocusNode.dispose();
    _idNumberFocusNode.dispose();
    _phoneNumberFocusNode.dispose();
    _nextOfKinFocusNode.dispose();
    _nextOfKinPhoneFocusNode.dispose();
    super.dispose();
  }

  void _submitPatientInfo() {
    // Retrieve data from controllers and send to Firestore
    String name = _nameController.text;
    int age = int.parse(_ageController.text);
    String idNumber = _idNumberController.text;
    String phoneNumber = _phoneNumberController.text;
    String address = _addressController.text;
    String nextOfKin = _nextOfKinController.text;
    String nextOfKinPhone = _nextOfKinPhoneController.text;

    // Send patient information to Firestore
    addPatient(name, age, selectedGender, idNumber, phoneNumber, address,
        nextOfKin, nextOfKinPhone);

    // Clear form fields
    _formKey.currentState!.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildTextField('Name', TextInputType.text, null, _ageFocusNode,
                    _nameController),
                const SizedBox(height: 16.0),
                _buildTextField('Age', TextInputType.number, _ageFocusNode,
                    _genderFocusNode, _ageController),
                const SizedBox(height: 16.0),
                _buildGenderDropdown(),
                const SizedBox(height: 16.0),
                _buildTextField('ID Number', TextInputType.text,
                    _genderFocusNode, _idNumberFocusNode, _idNumberController),
                const SizedBox(height: 16.0),
                _buildTextField(
                    'Phone Number',
                    TextInputType.phone,
                    _idNumberFocusNode,
                    _phoneNumberFocusNode,
                    _phoneNumberController),
                const SizedBox(height: 16.0),
                _buildTextField(
                    'Address',
                    TextInputType.text,
                    _phoneNumberFocusNode,
                    _addressFocusNode,
                    _addressController),
                const SizedBox(height: 16.0),
                _buildTextField(
                    'Next of Kin',
                    TextInputType.text,
                    _addressFocusNode,
                    _nextOfKinFocusNode,
                    _nextOfKinController),
                const SizedBox(height: 16.0),
                _buildTextField(
                    'Next of Kin Phone',
                    TextInputType.phone,
                    _nextOfKinFocusNode,
                    _nextOfKinPhoneFocusNode,
                    _nextOfKinPhoneController),
                const SizedBox(height: 32.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _submitPatientInfo();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const StaffHomePage()));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label,
      TextInputType keyboardType,
      FocusNode? currentFocus,
      FocusNode? nextFocus,
      TextEditingController controller,
      [String? errorMessage = '']) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
      keyboardType: keyboardType,
      textInputAction:
          nextFocus != null ? TextInputAction.next : TextInputAction.done,
      focusNode: currentFocus,
      validator: (value) {
        if (errorMessage != null && (value == null || value.isEmpty)) {
          return errorMessage;
        }
        return null;
      },
      onEditingComplete: () {
        if (nextFocus != null) {
          FocusScope.of(context).requestFocus(nextFocus);
        } else {
          // Handle the "Done" button press
          currentFocus?.unfocus();
        }
      },
    );
  }

  Widget _buildGenderDropdown() {
    return DropdownButtonFormField<String>(
      value: selectedGender,
      onChanged: (newValue) {
        setState(() {
          selectedGender = newValue!;
        });
      },
      items: [
        '',
        'Male',
        'Female',
        'Other',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      decoration: const InputDecoration(labelText: 'Gender'),
      focusNode: _genderFocusNode,
      // onEditingComplete: () {
      //   FocusScope.of(context).requestFocus(_idNumberFocusNode);
      // },
    );
  }
}
