import 'package:flutter/material.dart';

import 'package:low_office/Screens/log_in.dart';
import 'package:low_office/Screens/register.dart';
import 'package:low_office/widgets/custom_button.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  // void initState() {
  //   Future.delayed(const Duration(seconds: 1), () {
  //     Navigator.pushReplacement(context,
  //         MaterialPageRoute(builder: (context) => const LogInScreen()));
  //   });
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset(
              'assets/logo2.png',
              height: 250,
              width: 250,
            ),
            const SizedBox(
              height: 100,
            ),
            const Text(
              'Welcome to Our App!',
              style: TextStyle(
                  color: Color.fromARGB(255, 237, 200, 143),
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              'Let\'s make your account',
              style: TextStyle(
                  color: Color.fromARGB(255, 237, 200, 143),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Row(
              children: [
                CustomButton(
                    color: Colors.brown,
                    txtcolor: Colors.white,
                    ontap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LogInScreen(),
                        ),
                      );
                    },
                    text: 'Login'),
                const SizedBox(
                  width: 20,
                ),
                CustomButton(
                    color: Colors.brown,
                    txtcolor: Colors.white,
                    ontap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterPage(),
                        ),
                      );
                    },
                    text: 'Rigester'),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Version 1.0.0 , Developed by our team ',
              style: TextStyle(
                color: Colors.white54,
                fontSize: 8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
