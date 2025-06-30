import 'package:flutter/material.dart';
import '../../../../../../constants.dart';
import '../../../../chat_screen/presentation/view/chat_screen.dart';
import '../../../data/services/doctor_services.dart';
import '../../../data/models/doctor_model.dart';

class DoctorsScreenContent extends StatelessWidget {
  const DoctorsScreenContent({super.key});

  Future<List<DoctorModel>> _loadDoctors() => DoctorService().fetchDoctors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbeigeColor,
      appBar: AppBar(
        title: const Text('Doctors', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: kbeigeColor,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: FutureBuilder<List<DoctorModel>>(
        future: _loadDoctors(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: kprimaryColor),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Failed to load doctors.\n${snapshot.error}',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            );
          }

          final doctors = snapshot.data ?? [];

          if (doctors.isEmpty) {
            return const Center(
              child: Text(
                'No doctors found.',
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            itemCount: doctors.length,
            itemBuilder: (context, index) {
              final doctor = doctors[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: DoctorCard(doctor: doctor),
              );
            },
          );
        },
      ),
    );
  }
}



class DoctorCard extends StatelessWidget {
  final DoctorModel doctor;

  const DoctorCard({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: const Color(0xffD1C1B2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Row(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(doctor.profileImage),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.star_half, size: 26, color: kprimaryColor),
                        Text(
                          doctor.rating.toStringAsFixed(1),
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  right: 5,
                  top: 2,
                  child: Container(
                    width: 15,
                    height: 15,
                    decoration: const BoxDecoration(
                      color: Color(0xff8EF4BC),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dr. ${doctor.name}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Icon(Icons.location_on_outlined, color: Colors.black54),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          doctor.address,
                          style: const TextStyle(fontSize: 16, color: Colors.black54),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.phone_outlined, color: Colors.black54),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          doctor.phone,
                          style: const TextStyle(fontSize: 16, color: Colors.black54),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.email_outlined, color: Colors.black54),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          doctor.email,
                          style: const TextStyle(fontSize: 16, color: Colors.black54),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kprimaryColor,
                        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatScreen(
                              userName: "Dr. ${doctor.name}",
                              doctorId: doctor.email, // You may want to use doctor.id here
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        "Start chat",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

