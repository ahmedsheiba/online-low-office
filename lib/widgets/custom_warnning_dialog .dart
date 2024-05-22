import 'package:flutter/material.dart';
import 'package:low_office/Screens/setting.dart';
import 'package:low_office/Screens/upload.dart';

class CustomWarningDialog extends StatelessWidget {
  const CustomWarningDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          const CardDialog(),
          Positioned(
            top: 15,
            right: 15,
            height: 28,
            // width: 15,
            child: OutlinedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Image.asset(
                'assets/icon_close.png',
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CardDialog extends StatelessWidget {
  const CardDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      margin: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xff2A303E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/Alirt.png',
            width: 72,
          ),
          const SizedBox(
            height: 24,
          ),
          const Text(
            'Alirt',
            style: TextStyle(
              fontSize: 24,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          const Text(
            'This feature not currently available',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: const Color(0xff2A303E),
                    padding: const EdgeInsets.symmetric(
                        vertical: 8, horizontal: 32)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Ok'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
