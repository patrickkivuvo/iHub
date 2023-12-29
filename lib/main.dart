import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:my_duka/constants/theme.dart';
import 'package:my_duka/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:my_duka/firebase_helper/firebase_options/firebase_options.dart';
import 'package:my_duka/provider/app_provider.dart';
import 'package:my_duka/screens/welcome/welcome.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   Stripe.publishableKey =
   "pk_test_51MWx8OAVMyklfe3CsjEzA1CiiY0XBTlHYbZ8jQlGtVFIwQi4aNeGv8J1HUw4rgSavMTLzTwgn0XRlwoTVRFXyu2h00mRUeWmAf";
  await Firebase.initializeApp(
    options: DefaultFirebaseConfig.platformOptions,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((context) => AppProvider()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "iHub: Your Ultimate Apple Oasis!",
        theme: themeData,
        home: StreamBuilder(
          stream: FirebaseAuthHelper.instance.getAuthChange,
          builder: (context, snapshot) {
            // if (snapshot.hasData) {
            //   return const CustomBottomBar();
            // }
            return const Welcome();
          },
        ),
      ),
    );
  }
}
