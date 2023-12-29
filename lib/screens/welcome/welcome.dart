import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../constants/routes.dart';

import '../../constants/theme.dart';
import '../../widgets/primary_button/primary_button.dart';
import '../../widgets/top_titles/top_titles.dart';
import '../auth_ui/login/login.dart';
import '../auth_ui/sign_up/sign_up.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopTitles(subtitle: "", title: "Welcome 👋"),
            Container(
              width: double.infinity,
              height: 170,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Apple Store',
                          style: AppTheme.kBigTitle,
                        ),
                        const Gap(8),
                        Text(
                          'Find the Apple product and accessories you’re looking for',
                          style:
                              AppTheme.kBodyText.copyWith(color: kWhiteColor),
                        ),
                        const Gap(4),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kWhiteColor,
                              foregroundColor: kSecondaryColor,
                            ),
                            onPressed: () {
                              Routes.instance.push(
                                  widget: const Login(), context: context);
                            },
                            child: const Text('Shop new year'))
                      ],
                    ),
                  ),
                ),
                Image.asset('assets/general/landing.png'),
              ]),
            ),
            const SizedBox(
              height: 100.0,
            ),
            PrimaryButton(
              title: "Login",
              onPressed: () {
                Routes.instance.push(widget: const Login(), context: context);
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            PrimaryButton(
              title: "Sign Up",
              onPressed: () {
                Routes.instance.push(widget: const SignUp(), context: context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
