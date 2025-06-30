import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/Features/auth/Forget_Password/Presentation/views/password_reset.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../../constants.dart';

class CheckEmail extends StatefulWidget {
  const CheckEmail({super.key});

  @override
  State<CheckEmail> createState() => _CheckEmailState();
}

class _CheckEmailState extends State<CheckEmail> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pinCodeController = TextEditingController();
  Timer? _timer;
  int _countDown = 30;
  bool canResend = false;

  final String uid = 'user-uid'; // Placeholder
  final String token = 'reset-token'; // Placeholder

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _pinCodeController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_countDown > 0) {
          _countDown--;
        } else {
          canResend = true;
          _timer?.cancel();
        }
      });
    });
  }

  void _resendOtp() {
    if (canResend) {
      setState(() {
        _countDown = 30;
        canResend = false;
      });
      startTimer();
      // TODO: Trigger resend OTP service
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbeigeColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(right: -120, top: -90, child: buildCircle(Colors.white)),
            Positioned(right: 60, top: -90, child: buildCircle(const Color(0xffDAC9B6))),
            Positioned(left: -120, top: -90, child: buildCircle(const Color(0xffCEB395))),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildBackButton(),
                  const SizedBox(height: 50),
                  buildHeaderText(),
                  const SizedBox(height: 10),
                  buildSubText(),
                  const SizedBox(height: 20),
                  buildForm(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCircle(Color color) {
    return Container(
      width: 400,
      height: 400,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }

  Widget buildBackButton() {
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

  Widget buildHeaderText() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: const Text(
        "Check your email",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
      ),
    );
  }

  Widget buildSubText() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: const Text(
        'We sent a reset link to username@gmail...com\nEnter the 6-digit code mentioned in the email.',
        style: TextStyle(fontSize: 14, color: Colors.black54),
      ),
    );
  }

  Widget buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
            topLeft: Radius.circular(50),
          ),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Text("Enter your code", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
              pinCodeTextField(context),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Didn’t get the code?', style: TextStyle(color: Colors.black54)),
                  InkWell(
                    onTap: _resendOtp,
                    child: const Text(' Resend code', style: TextStyle(color: kprimaryColor)),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('OTP expires in:', style: TextStyle(color: Colors.black54)),
                  const SizedBox(width: 10),
                  Text('00:${_countDown.toString().padLeft(2, '0')}', style: const TextStyle(color: kprimaryColor)),
                ],
              ),
              const SizedBox(height: 60),
              SizedBox(
                height: 55,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // TODO: Validate code with backend here
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PasswordReset(uid: uid, token: token),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kprimaryColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text("Verify Code", style: TextStyle(color: Colors.white, fontSize: 22)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget pinCodeTextField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: PinCodeTextField(
        appContext: context,
        length: 6,
        controller: _pinCodeController,
        enableActiveFill: true,
        animationType: AnimationType.fade,
        animationDuration: const Duration(milliseconds: 300),
        validator: (value) => value!.length < 6 ? 'Enter all 6 digits' : null,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(10),
          fieldHeight: 60,
          fieldWidth: Get.width * 0.15,
          inactiveColor: Colors.grey,
          activeColor: Colors.orange,
          activeFillColor: Colors.white,
          inactiveFillColor: Colors.white,
          selectedFillColor: Colors.white,
          selectedColor: Colors.black,
        ),
      ),
    );
  }
}