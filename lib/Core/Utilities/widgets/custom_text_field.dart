import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({
    super.key,
      this.hintText,
     this.onChanged,
     this.obSecure,

  });


   String? hintText;
   Function(String)? onChanged;
   bool? obSecure;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: true,
      // controller: _emailController,
      onChanged: onChanged,

      decoration: InputDecoration(

        labelText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),

        ),
      ),
    );
  }
}