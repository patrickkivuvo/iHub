// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_duka/constants/constants.dart';
import 'package:my_duka/constants/routes.dart';
import 'package:my_duka/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:my_duka/screens/auth_ui/forgot_password/forgot_password.dart';
import 'package:my_duka/screens/auth_ui/sign_up/sign_up.dart';
import 'package:my_duka/screens/custom_bottom_bar/custom_bottom_bar.dart';
import 'package:my_duka/widgets/primary_button/primary_button.dart';
import 'package:my_duka/widgets/top_titles/top_titles.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool isShowPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopTitles(
                  subtitle: "Welcome Back To iHub", title: "Login"),
              const SizedBox(
                height: 46.0,
              ),
              TextFormField(
                controller: email,
                decoration: const InputDecoration(
                  hintText: "E-mail",
                  prefixIcon: Icon(
                    Icons.email_outlined,
                  ),
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              TextFormField(
                controller: password,
                obscureText: isShowPassword,
                decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: const Icon(
                    Icons.password_sharp,
                  ),
                  suffixIcon: CupertinoButton(
                      onPressed: () {
                        setState(() {
                          isShowPassword = !isShowPassword;
                        });
                      },
                      padding: EdgeInsets.zero,
                      child: Icon(
                        isShowPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      )),
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CupertinoButton(
                      onPressed: () {
                        Routes.instance.push(
                            widget: const ForgorPassword(), context: context);
                      },
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      )),
                ],
              ),
              const SizedBox(
                height: 26.0,
              ),
              PrimaryButton(
                title: "Login",
                onPressed: () async {
                  bool isVaildated = loginVaildation(email.text, password.text);
                  if (isVaildated) {
                    bool isLogined = await FirebaseAuthHelper.instance
                        .login(email.text, password.text, context);
                    if (isLogined) {
                      Routes.instance.pushAndRemoveUntil(
                          widget: const CustomBottomBar(), context: context);
                    }
                  }
                },
              ),
              const SizedBox(
                height: 24.0,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Routes.instance
                            .push(widget: const SignUp(), context: context);
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: const Color(0xFF843667),
                      ),
                      child: const Text(
                        "Sign up",
                        style: TextStyle(decoration: TextDecoration.underline),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
