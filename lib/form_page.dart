import 'package:day_1/custom_text_form_field.dart';
import 'package:day_1/register.dart';
import 'package:day_1/services_login.dart';
import 'package:day_1/show_toast.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           CustomTextFormField(
            controller:email ,
            keyboardType: TextInputType.emailAddress,
            readOnly: false,
            text: "Email@gmail.com",
            contentPadding: 20,
          ),
          const SizedBox(
            height: 50,
          ),
           CustomTextFormField(
            controller: password,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            readOnly: false,
            text: "password",
            contentPadding: 20,
          ),
          MaterialButton(
            color: Colors.blue,
            onPressed: () {
setState(() {
  LoginServices().postData(username: email.text, password: password.text).then((data){
    print(data);
    showToast(color: Colors.red, msg: data ['token']);

  });

});
            },
            child: const Text("Login"),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Are u New User"),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Register(),
                        ));
                  },
                  child: const Text("Register")),
            ],
          ),
        ],
      ),
    );
  }
}
