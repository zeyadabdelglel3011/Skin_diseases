import 'package:flutter/material.dart';
import 'package:graduation_project/Core/Utilities/widgets/custom_text_field.dart';
import 'package:graduation_project/Features/Login/presentation/views/login_screen.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/Core/Utilities/widgets/create_account_doctor _button.dart';
import '../../data/doctor_auth_service.dart';

class CreateAccountDoctor extends StatefulWidget {
  const CreateAccountDoctor({super.key});

  @override
  State<CreateAccountDoctor> createState() => _CreateAccountDoctorState();
}

class _CreateAccountDoctorState extends State<CreateAccountDoctor> {
  String? email;
  String? password;
  String? confirmPassword;
  String? firstName;
  String? lastName;
  String? idNumber;
  bool isSelected = false;

  final _formKey = GlobalKey<FormState>();

  void showSnakBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbeigeColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Decorative Circles
            Positioned(
              right: -140,
              top: -70,
              child: Container(
                width: 400,
                height: 400,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              right: 60,
              top: -70,
              child: Container(
                width: 400,
                height: 400,
                decoration: const BoxDecoration(
                  color: Color(0xffDAC9B6),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              left: -120,
              top: -70,
              child: Container(
                width: 400,
                height: 400,
                decoration: const BoxDecoration(
                  color: Color(0xffCEB395),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back Button
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: kprimaryColor),
                    ),
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back, color: Colors.black54),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Text(
                      'Go ahead and set up \n your account',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Text(
                      'Sign up to enjoy the best managing experience',
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Form Section
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Create Account',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomTextField(
                                    hintText: "First Name",
                                    onChanged: (val) => firstName = val,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: CustomTextField(
                                    hintText: "Last Name",
                                    onChanged: (val) => lastName = val,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            CustomTextField(
                              hintText: "ID Number",
                              onChanged: (val) => idNumber = val,
                            ),
                            const SizedBox(height: 20),
                            CustomTextField(
                              hintText: "Email",
                              onChanged: (val) => email = val,
                            ),
                            const SizedBox(height: 20),
                            CustomTextField(
                              hintText: "Create Password",
                              obscureText: true,
                              onChanged: (val) => password = val,
                            ),
                            const SizedBox(height: 20),
                            CustomTextField(
                              hintText: "Confirm Password",
                              obscureText: true,
                              onChanged: (val) => confirmPassword = val,
                            ),
                            const SizedBox(height: 25),
                            CreateDoctorAccountButton(
                              onTap: () async {
                                if ([firstName, lastName, idNumber, email, password, confirmPassword]
                                    .any((e) => e == null || e.trim().isEmpty)) {
                                  showSnakBar(context, "Please fill all fields");
                                  return;
                                }
                                if (password != confirmPassword) {
                                  showSnakBar(context, "Passwords do not match");
                                  return;
                                }

                                try {
                                  await DoctorAuthService().registerDoctor(
                                    firstName: firstName!.trim(),
                                    lastName: lastName!.trim(),
                                    email: email!.trim(),
                                    password: password!,
                                    confirmPassword: confirmPassword!,
                                    idNumber: idNumber!.trim(),
                                  );
                                  showSnakBar(context, "Account Created Successfully");
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (_) => const LoginScreen(userType: "doctor",)),
                                  );
                                } catch (e) {
                                  showSnakBar(context, "Error: ${e.toString()}");
                                }
                              },
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Already have an account?",
                                    style: TextStyle(color: Colors.black54)),
                                const SizedBox(width: 10),
                                GestureDetector(
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (_) => const LoginScreen( userType:"doctor",)),
                                  ),
                                  child: const Text("Login", style: TextStyle(color: kprimaryColor)),
                                ),
                              ],
                            ),
                            const SizedBox(height: 40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(width: 170, height: 2, color: Colors.grey.shade400),
                                const Text('or', style: TextStyle(fontSize: 16)),
                                Container(width: 170, height: 2, color: Colors.grey.shade400),
                              ],
                            ),
                            const SizedBox(height: 20),
                            // Social Buttons
                            Column(
                              children: [
                                _buildSocialButton("images/go.png", "Sign up with Google"),
                                const SizedBox(height: 10),
                                _buildSocialButton("images/apple.png", "Sign up with Apple"),
                                const SizedBox(height: 10),
                                _buildSocialButton("images/email.png", "Sign up with Email"),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Checkbox(
                                      activeColor: kprimaryColor,
                                      value: isSelected,
                                      onChanged: (val) =>
                                          setState(() => isSelected = val ?? false),
                                    ),
                                    const Flexible(
                                      child: Text(
                                        'I accept the privacy policy\nAnd agree to the terms of service',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
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

  Widget _buildSocialButton(String iconPath, String text) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400, width: 1.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(iconPath, fit: BoxFit.cover, height: 40),
            Text(
              text,
              style: const TextStyle(fontSize: 18, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
