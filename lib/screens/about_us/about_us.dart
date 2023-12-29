import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // backgroundColor: Colo,
        title: const Text(
          "About Us",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(12.0),
        child: Text(
            "Welcome to iHub 👋! Your premier destination for top-notch Apple products. We're passionate about delivering cutting-edge technology to our customers with a seamless and personalized shopping experience. Explore our curated selection of iPhones, MacBooks, and accessories, backed by exceptional customer service. Elevate your tech lifestyle with iHub."
            ),
      ),
    );
  }
}
