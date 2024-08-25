import 'package:day_1/custom_text_form_field.dart';
import 'package:day_1/services_login.dart';
import 'package:day_1/show_toast.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  Register({super.key});
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController conforimpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextFormField(
              keyboardType: TextInputType.name,
              readOnly: false,
              text: "username",
              contentPadding: 20.0,
              controller: username,
            ),
            const SizedBox(height: 20.0),
            CustomTextFormField(
              keyboardType: TextInputType.name,
              readOnly: false,
              text: "email@gmail.com",
              contentPadding: 20.0,
              controller: email,
            ),
            const SizedBox(height: 20.0),
            CustomTextFormField(
              keyboardType: TextInputType.name,
              readOnly: false,
              text: "password",
              contentPadding: 20.0,
              controller: password,
            ),
            const SizedBox(height: 20.0),
            CustomTextFormField(
              keyboardType: TextInputType.name,
              readOnly: false,
              text: "Conforim password",
              contentPadding: 20.0,
              controller: conforimpassword,
            ),
            const SizedBox(height: 20.0),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                RegisterServices().postData(
                    email: email.text,
                    username: username.text,
                    password: password.text,
                    comfirepassword: conforimpassword.text);
                showToast(
                    color: Colors.red, msg: "There isnot Database Craeted");
              },
              child: const Text("Register"),
            )
          ],
        ),
      ),
    );
  }
}
