import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../constants/routes.dart';
import '../../../widgets/primary_button/primary_button.dart';
import '../../../widgets/top_titles/top_titles.dart';
import '../login/login.dart';

class ForgorPassword extends StatefulWidget {
  const ForgorPassword({super.key});

  @override
  State<ForgorPassword> createState() => _ForgorPasswordState();
}

class _ForgorPasswordState extends State<ForgorPassword> {
  TextEditingController email = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email.text.trim());

      Navigator.of(context, rootNavigator: true).pop();
      showMessage("Email Send Successfully");
      Routes.instance.push(widget: const Login(), context: context);
      return true;
    } on FirebaseAuthException catch (error) {
      Navigator.of(context, rootNavigator: true).pop();
      showMessage(error.code.toString());
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: TopTitles(
                  subtitle:
                      "Enter your email and we will send you a password reset link.",
                  title: "Forgot Password?"),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                controller: email,
                decoration: const InputDecoration(
                  hintText: "E-mail",
                  prefixIcon: Icon(
                    Icons.email_outlined,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 18.0,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: PrimaryButton(
                title: "Reset Password",
                onPressed: passwordReset,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
