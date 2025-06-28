import 'package:flutter/material.dart';

import 'package:graduation_project/constants.dart';
import '../../Data/models/medicineData.dart';
import 'Widgets/all_medicines.dart';

class MedicinesScreenDoctor extends StatefulWidget {
  const MedicinesScreenDoctor({super.key});

  @override
  State<MedicinesScreenDoctor> createState() => _MedicinesScreenDoctorState();
}

class _MedicinesScreenDoctorState extends State<MedicinesScreenDoctor> {
  final TextEditingController _searchController = TextEditingController();
  List<MedicinesData> _filteredMedicines = medicinesData;

  void _filterMedicines(String query) {
    final lowerQuery = query.toLowerCase();
    setState(() {
      _filteredMedicines = medicinesData.where((medicine) {
        return medicine.title.toLowerCase().contains(lowerQuery);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kbeigeColor,
        title: const Text(
          "Medicines",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: kbeigeColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: Column(
              children: [
                // Search bar + filter button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 320,
                      height: 45,
                      child: TextFormField(
                        controller: _searchController,
                        onChanged: _filterMedicines,
                        decoration: InputDecoration(
                          hintText: "Search for medicine...",
                          prefixIcon: const Icon(Icons.search, color: Colors.black),
                          contentPadding: const EdgeInsets.symmetric(vertical: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: kprimaryColor,
                              width: 1.5,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: kprimaryColor,
                              width: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: kprimaryColor,
                          width: 1.5,
                        ),
                      ),
                      child: const Icon(Icons.filter_alt_outlined),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                // Grid view
                GridView.builder(
                  itemCount: _filteredMedicines.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: .9,
                  ),
                  itemBuilder: (context, index) => AllMedicinesDoctor(
                    pic: _filteredMedicines[index].pic,
                    title: _filteredMedicines[index].title,
                    desc: _filteredMedicines[index].desc,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
