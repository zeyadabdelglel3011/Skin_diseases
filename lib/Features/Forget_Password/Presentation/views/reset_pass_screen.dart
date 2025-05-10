
import 'package:flutter/material.dart';

import '../../../../../../../constants.dart';
import '../../../Login/presentation/views/login_screen.dart';


class PasswordReset extends StatefulWidget{
  const PasswordReset ({super.key});

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _newPassController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();

  @override
  void dispose() {
    _newPassController.dispose();
    _confirmPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbeigeColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            // Background circles
            Positioned(right: -120, top: -90, child: buildCircle(Colors.white)),
            Positioned(right: 60, top: -90, child: buildCircle(Color(0xffDAC9B6))),
            Positioned(left: -120, top: -90, child: buildCircle(Color(0xffCEB395))),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildBackButton(context),
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

  Widget buildBackButton(BuildContext context) {
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
        "Password Reset",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
      ),
    );
  }

  Widget buildSubText() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: const Text(
        'Your password has been successfully reset.',
        style: TextStyle(fontSize: 14, color: Colors.black54),
      ),
    );
  }

  Widget buildForm(BuildContext context) {
    return Form(
      key: _formkey,
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
              TextFormField(
                controller: _newPassController,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter new password';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "New Password",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: _confirmPassController,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  } else if (value != _newPassController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Confirm Your Password",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 80),
              Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kprimaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: GestureDetector(
                  onTap: () {
                    if (_formkey.currentState!.validate()) {
                      showDialogFunc(
                        context,
                        'images/77.png',
                        "Password has been changed successfully",
                        "You have just reset your password, click on the button below to login.",
                      );
                    }
                  },
                  child: const Center(
                    child: Text(
                      "Reset Password",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

showDialogFunc(context,img,title,desc){
  return showDialog(
      context: context,
      builder: (context){
        return Container(
          padding: EdgeInsets.only(top: 120.0,bottom: 120.0),
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              margin:  const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kbeigeColor,
              ),

              //padding: EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width,
              height: 600,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:<Widget> [
                  Image.asset('images/2.png',
                    width: 150,
                    height: 150,
                  ),

                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset('images/suc.png',
                        width: 70,
                        height: 70,),
                    ),
                  ),
                  Text(title,
                    style:const TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.only(left: 50.0,right: 50.0),
                    child: Center(
                      child: Text(desc,
                        style:const TextStyle(
                          fontSize: 15,
                          color:Color(0xff676666),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 80,),
                  Center(
                    child: Container(
                      height: 55,
                      width: 380,
                      decoration: BoxDecoration(
                        color: kprimaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (e)=>const LoginScreen(userType: "",)));
                        },
                        child: const Center(
                          child: Text("Login",style: TextStyle(color: Colors.white,
                              fontSize: 22),),
                        ),
                      ),
                    ),
                  ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset('images/22.png',
                    width: 166,
                    height: 115,
                  ),
                ],
              ),
                ],
              ),
            ),
          ),
        );
      }
  );
}