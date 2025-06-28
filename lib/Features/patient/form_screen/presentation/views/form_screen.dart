import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../constants.dart';
import '../view_model/form_view_model.dart';
import 'form_fields.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FormViewModel(),
      child: const _FormScreenBody(),
    );
  }
}

class _FormScreenBody extends StatelessWidget {
  const _FormScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<FormViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kbeigeColor,
        title: const Text('Patient Intake Form'),
        centerTitle: true,
      ),
      backgroundColor: kbeigeColor,
      body: FormFields(viewModel: viewModel),
      bottomNavigationBar: _bottomButtons(context, viewModel),
    );
  }

  Widget _bottomButtons(BuildContext context, FormViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: kprimaryColor,
              minimumSize: const Size(double.infinity, 55),
            ),
            onPressed: () => viewModel.submitForm(context),
            child: const Text("Submit", style: TextStyle(fontSize: 18 , color: Colors.white)),
          ),
          const SizedBox(height: 10),
          OutlinedButton(
            onPressed: viewModel.clearForm,
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(double.infinity, 55),
              side: BorderSide(color: kprimaryColor),
            ),
            child: const Text("Clear Form", style: TextStyle(fontSize: 18 , color: Colors.black)),
          ),
        ],
      ),
    );
  }
}
