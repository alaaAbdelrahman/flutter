import 'package:day_1/custom_text_form_field.dart';
import 'package:day_1/show_toast.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  Register({super.key});
  TextEditingController firstName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController conforimpassword = TextEditingController();
  TextEditingController phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextFormField(
              keyboardType: TextInputType.name,
              readOnly: false,
              text: "First name",
              contentPadding: 20.0,
              controller: firstName,
            ),
            const SizedBox(height: 20.0),
            CustomTextFormField(
              keyboardType: TextInputType.name,
              readOnly: false,
              text: "First name",
              contentPadding: 20.0,
              controller: firstName,
            ),
            const SizedBox(height: 20.0),
            CustomTextFormField(
              keyboardType: TextInputType.name,
              readOnly: false,
              text: "email@gmail.com",
              contentPadding: 20.0,
              controller: firstName,
            ),
            const SizedBox(height: 20.0),
            CustomTextFormField(
              keyboardType: TextInputType.name,
              readOnly: false,
              text: "password",
              contentPadding: 20.0,
              controller: firstName,
            ),
            const SizedBox(height: 20.0),
            CustomTextFormField(
              keyboardType: TextInputType.name,
              readOnly: false,
              text: "Conforim password",
              contentPadding: 20.0,
              controller: firstName,
            ),
            const SizedBox(height: 20.0),
            CustomTextFormField(
              keyboardType: TextInputType.name,
              readOnly: false,
              text: "Phone",
              contentPadding: 20.0,
              controller: firstName,
            ),
            const SizedBox(height: 20.0),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                print("sadsad");
                showToast(
                    color: Colors.red, msg: "There isnot Database Craeted");
              },
              child: const Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}
