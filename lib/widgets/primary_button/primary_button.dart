import 'package:flutter/material.dart';


class PrimaryButton extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  const PrimaryButton({super.key, this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: double.infinity,
      child: ElevatedButton(
         style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color(0xFF843667),
  
                      ),
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}

