import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ionicons/ionicons.dart';
import 'package:low_office/Screens/home_page.dart';
import 'package:low_office/Screens/payment.dart';
import 'package:low_office/helper/constant.dart';
import 'package:low_office/widgets/custom_button.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(image: AssetImage('assets/success.png')),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Success',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Your payment was done successfully',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: CustomButton(
                    color: Theme.of(context).colorScheme.secondary,
                    txtcolor: Colors.white,
                    text: 'Ok')),
          ],
        ),
      ),
    );
  }
}
