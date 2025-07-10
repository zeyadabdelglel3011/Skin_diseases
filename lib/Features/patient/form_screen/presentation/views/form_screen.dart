import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import 'form_fields.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _FormScreenBody();
  }
}

class _FormScreenBody extends StatefulWidget {
  const _FormScreenBody({super.key});

  @override
  State<_FormScreenBody> createState() => _FormScreenBodyState();
}

class _FormScreenBodyState extends State<_FormScreenBody> {
  final _formKey = GlobalKey<FormState>();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.green,
            content: Text('Form Submitted Successfully', style: TextStyle(
              color: Colors.white,
            ),) ),
      );
    }
  }

  void _clearForm() {
    _formKey.currentState?.reset();
    setState(() {}); // Triggers rebuild to clear fields
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kbeigeColor,
        title: const Text('Patient Intake Form'),
        centerTitle: true,
      ),
      backgroundColor: kbeigeColor,
      body: FormFields(formKey: _formKey),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kprimaryColor,
                minimumSize: const Size(double.infinity, 55),
              ),
              onPressed: _submitForm,
              child: const Text("Submit", style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: _clearForm,
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 55),
                side: const BorderSide(color: kprimaryColor),
              ),
              child: const Text("Clear Form", style: TextStyle(fontSize: 18, color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}
