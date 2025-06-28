import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../../constants.dart';
import '../../../../patient/notification_screen/prsentation/view/notification_screen.dart';
import '../../../../patient/privacy_policy_screen/presentation/views/privacy_policy_screen.dart';
import '../../../edit_doctor_profile/presentation/view/edti_profile_doctor_screen.dart';

class ProfileDoctorScreen extends StatefulWidget {
  final String email;

  const ProfileDoctorScreen({super.key, required this.email});

  @override
  State<ProfileDoctorScreen> createState() => _ProfileDoctorScreenState();
}

class _ProfileDoctorScreenState extends State<ProfileDoctorScreen> {
  String? extractName(String email) {
    if (email.isEmpty || !email.contains('@')) return null;
    final namePart = email.split('@').first;
    if (namePart.isEmpty) return null;
    return namePart[0].toUpperCase() + namePart.substring(1).toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    final String? name = extractName(widget.email);

    return Scaffold(
      backgroundColor: kbeigeColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "Profile",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Stack(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset('images/doc.png'),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: kprimaryColor.withOpacity(0.5),
                        ),
                        child: const Icon(
                          LineAwesomeIcons.image,
                          color: Colors.black,
                          size: 25,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  name ?? "Doctor",
                  style: const TextStyle(
                    color: kprimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              Center(
                child: Text(
                  widget.email,
                  style: const TextStyle(
                    color: Color(0xff676666),
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              ProfileMenuWidget(
                "Edit Your Profile",
                LineAwesomeIcons.user_edit_solid,
                    () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfileDoctorScreen(
                        name: name ?? '',
                        email: widget.email,
                      ),
                    ),
                  );
                },
                true,
              ),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                "Privacy And Policy",
                LineAwesomeIcons.shield_alt_solid,
                    () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PrivacyPolicyScreen(),
                    ),
                  );
                },
                true,
              ),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                "Notification Settings",
                CupertinoIcons.bell,
                    () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotificationScreen(),
                    ),
                  );
                },
                true,
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

Widget ProfileMenuWidget(
    String title,
    IconData icon,
    VoidCallback onTap,
    bool endIcon,
    ) {
  return ListTile(
    onTap: onTap,
    leading: Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: kprimaryColor,
      ),
      child: Icon(icon, color: Colors.white),
    ),
    title: Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
    trailing: endIcon
        ? const Icon(
      CupertinoIcons.chevron_forward,
      size: 18.0,
      color: Colors.black,
    )
        : null,
  );
}
