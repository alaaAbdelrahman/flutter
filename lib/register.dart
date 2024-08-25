import 'package:day_1/custom_text_form_field.dart';
import 'package:day_1/services_login.dart';
import 'package:day_1/show_toast.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  Register({super.key});
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
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
              obscureText: true,
              controller: password,
            ),
            const SizedBox(height: 20.0),
            CustomTextFormField(
              keyboardType: TextInputType.name,
              readOnly: false,
              text: "Confirm password",
              obscureText: true,

              contentPadding: 20.0,
              controller: confirmpassword,
            ),
            const SizedBox(height: 20.0),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                RegisterServices().postData(
                    email: email.text,
                    username: username.text,
                    password: password.text,
                    confirmpassword: confirmpassword.text).then((data){
                  showToast(
                      color: Colors.green, msg: data.toString());
                });
              },
              child: const Text("Register"),
            )
          ],
        ),
      ),
    );
  }
}
