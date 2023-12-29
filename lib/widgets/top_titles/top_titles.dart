import 'package:flutter/material.dart';
import 'package:my_duka/constants/theme.dart';

class TopTitles extends StatelessWidget {
  final String title, subtitle;
  const TopTitles({super.key, required this.subtitle, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: kToolbarHeight + 12,
        ),
        if (title == "Login" || title == "Create Account" || title == "Forgot Password?")
          GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.arrow_back_ios)),
        const SizedBox(
          height: 12.0,
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: kSecondaryColor,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 18.0,
            color: kSecondaryColor
          ),
        ),
      ],
    );
  }
}
