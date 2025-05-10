import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/Features/Forget_Password/Presentation/views/reset_pass_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../constants.dart';

class CheckEmail extends StatefulWidget{
  const CheckEmail ({super.key});
  @override
  State<CheckEmail> createState() => _CheckEmailState();
}

class _CheckEmailState extends State<CheckEmail> {

  final _formkey=GlobalKey<FormState>();
  Timer? _timer;
  int _countDown=30;
  bool canResend=false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _timer!.cancel();
  }

  void startTimer(){
    _timer= Timer.periodic(Duration(seconds: 1),(timer){
      setState(() {

        if(_countDown>0){
          _countDown--;
        }else{
          canResend=true;
          _timer?.cancel();
        }

      });
    });
  }
  void _resendOtp(){
    if(canResend) {
      setState(() {
        _countDown = 30;
        canResend = false;
      });
      startTimer();
    }
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbeigeColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children:[
            // white
            Positioned(
              right: -120,
              top: -90,
              child: Container(
                width: 400,
                height: 400,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            // white beige
            Positioned(
              right: 60,
              top: -90,
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
              top: -90,
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
            padding: const EdgeInsets.symmetric(vertical: 80,  ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin:  const EdgeInsets.symmetric(horizontal: 20),
                  // padding: EdgeInsets.symmetric(horizontal: 20),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: kprimaryColor,
                    ),
                  ),
                  child: IconButton(onPressed: (){
                    Navigator.pop(context);
                  },
                    icon:const Icon(Icons.arrow_back,
                      color: Colors.black54,
                    ) ,
                  ),
                ),
                const SizedBox(height: 50,),
                Container(
                  margin:  const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text(
                    "Check your email",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Container(
                  margin:  const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text(
                    'We sent a reset link to username@gmail...com\nenter 6 digit code that mentioned in the email ',
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ),

                const SizedBox(height: 20,),

                // The white container for text form fields
                Form(
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 40,),

                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: const Text(
                            'Enter your code',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Form(child: Column(
                            children: [
                              const SizedBox(height: 10,),

                              pinCodeTextField(context),
                              const SizedBox(height: 5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const  Text(
                                    'Didn’t get the code?',
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),

                                  InkWell(
                                    onTap: (){
                                      _resendOtp();
                                    },
                                    child:const Text('resend code',
                                      style: TextStyle(
                                        color: kprimaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'oTP expires in: ',
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),

                                  const  SizedBox(width: 10,),
                                  Text('00:${_countDown.toString()}',
                                    style:const TextStyle(
                                      color: kprimaryColor,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 60,),
                              GestureDetector(
                                onTap: (){
                                  if(_formkey.currentState!.validate()){
                                    setState(() {
                                      // email=emailController.text;
                                      // password=passController.text;
                                    });
                                  }

                                },
                                child: Container(
                                  height: 55,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: kprimaryColor,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: GestureDetector(
                                    onTap: (){
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder:(e)=>const PasswordReset()));
                                    },
                                    child: const Center(
                                      child: Text("Verify Code",style: TextStyle(color: Colors.white,
                                          fontSize: 22),),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          ),
                        ),
                      ],
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
Widget pinCodeTextField(BuildContext context){
  return Padding(padding: EdgeInsets.symmetric(vertical: 20),
    child: PinCodeTextField(
      appContext: context,
      length: 6,
      enableActiveFill: true,
      animationType: AnimationType.fade,
      animationDuration: Duration(milliseconds: 300),
      pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(10),
          fieldHeight: 60,
          fieldWidth: Get.width*0.15,
          inactiveColor:Colors.grey,
          activeColor: Colors.orange,
          activeFillColor: Colors.white,
          inactiveFillColor: Colors.white,
          selectedFillColor: Colors.white,
          selectedColor: Colors.black
      ),
    ),
  );
}

