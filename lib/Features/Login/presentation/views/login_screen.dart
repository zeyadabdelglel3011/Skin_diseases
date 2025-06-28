import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:graduation_project/Features/Forget_Password/Presentation/views/forget_pass_screen.dart';
import 'package:graduation_project/Features/Home_screen/Presentation/Views/home_screen.dart';
import 'package:graduation_project/nav_bar.dart';
import '../../../../constants.dart';
import '../../data/login_service.dart';

class LoginScreen extends StatefulWidget {
  final String userType; // 'doctor' or 'patient'

  const LoginScreen({super.key, required this.userType});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginService loginService = LoginService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  bool isSelected = false;
  bool isSelected1 = false;

  Future<void> handleLogin() async {
    setState(() => isLoading = true);

    final result = await LoginService.login(
      emailController.text.trim(),
      passwordController.text.trim(),
    );

    setState(() => isLoading = false);

    if (result['success']) {

      final String name = widget.userType == 'doctor'
          ? 'Dr. ${emailController.text.trim()}'
          : emailController.text.trim();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'تم تسجيل الدخول بنجاح',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 3),
        ),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => NavBar(email: name ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Login failed: ${result['message']}',
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbeigeColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Background Circles
            Positioned(right: -120, top: -90, child: _circle(Colors.white)),
            Positioned(right: 60, top: -90, child: _circle(const Color(0xffDAC9B6))),
            Positioned(left: -120, top: -90, child: _circle(const Color(0xffCEB395))),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _backButton(context),
                  const SizedBox(height: 50),
                  _welcomeText(),
                  const SizedBox(height: 20),
                  _formContainer(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _circle(Color color) {
    return Container(
      width: 400,
      height: 400,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }

  Widget _backButton(BuildContext context) {
    return Container(
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
    );
  }

  Widget _welcomeText() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("Welcome Back !",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
          SizedBox(height: 10),
          Text(
            'Sign in-up to enjoy the best managing experience',
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
        ],
      ),
    );
  }

  Widget _formContainer(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50),
          topLeft: Radius.circular(50),
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              const Text("Login",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
              const SizedBox(height: 20),
              _textField("Email", emailController),
              const SizedBox(height: 20),
              _textField("Password", passwordController, obscure: true),
              const SizedBox(height: 10),
              _optionsRow(context),
              const SizedBox(height: 40),
              _loginButton(),
              const SizedBox(height: 40),
              _dividerWithText("or"),
              const SizedBox(height: 10),
              _socialLoginButtons(),
              const SizedBox(height: 20),
              _privacyAgreement(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textField(String label, TextEditingController controller,
      {bool obscure = false}) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  Widget _optionsRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          Checkbox(
            activeColor: kprimaryColor,
            value: isSelected,
            onChanged: (val) => setState(() => isSelected = val ?? false),
          ),
          const Text('Remember Me', style: TextStyle(color: Colors.black54)),
        ]),
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ForgetPassScreen()),
          ),
          child: const Text(
            'Forget Password?',
            style: TextStyle(color: kprimaryColor),
          ),
        ),
      ],
    );
  }

  Widget _loginButton() {
    return SizedBox(
      height: 55,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isLoading ? null : handleLogin,
        style: ElevatedButton.styleFrom(
          backgroundColor: kprimaryColor,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: isLoading
            ? const CircularProgressIndicator(color: Colors.white)
            : const Text("Login",
            style: TextStyle(color: Colors.white, fontSize: 22)),
      ),
    );
  }

  Widget _dividerWithText(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _divider(),
        Text(text, style: const TextStyle(fontSize: 16)),
        _divider(),
      ],
    );
  }

  Widget _divider() {
    return Container(
      width: 170,
      height: 2,
      color: Colors.grey.shade400,
    );
  }

  Widget _socialLoginButtons() {
    return Column(
      children: [
        _socialButton("images/go.png", "Sign up with Google"),
        const SizedBox(height: 10),
        _socialButton("images/apple.png", "Sign up with Apple"),
        const SizedBox(height: 10),
        _socialButton("images/email.png", "Sign up with Email"),
      ],
    );
  }

  Widget _socialButton(String asset, String text) {
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
            Image.asset(asset, height: 40, fit: BoxFit.cover),
            Text(
              text,
              style: const TextStyle(fontSize: 18, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }

  Widget _privacyAgreement() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          activeColor: kprimaryColor,
          value: isSelected1,
          onChanged: (val) => setState(() => isSelected1 = val ?? false),
        ),
        const Text(
          'I accept the privacy policy\nAnd agree to the terms of service',
          style: TextStyle(color: Colors.black87, fontSize: 15),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
