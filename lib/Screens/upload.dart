import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:low_office/Screens/home_page.dart';
import 'package:low_office/helper/constant.dart';
import 'package:low_office/widgets/custom_button.dart';
import 'package:low_office/widgets/custom_success_dialog.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  FilePickerResult? result;
  String? fileName;
  PlatformFile? pickedfile;
  bool isLoading = false;
  File? fileTODisplay;

  void pickFile() async {
    try {
      setState(() {
        isLoading = true;
      });

      result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['png', 'pdf', 'jpeg'],
        allowMultiple: false,
      );

      if (result != null) {
        fileName = result!.files.first.name;
        pickedfile = result!.files.first;
        fileTODisplay = File(pickedfile!.path.toString());

        print('File name $fileName');
      }

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          shadowColor: Colors.black,
          title: Text(
            'About Page',
            style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold,
                fontFamily: 'Pacifico'),
          ),
          leading: IconButton(
            color: Theme.of(context).colorScheme.secondary,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            icon: const Icon(Ionicons.chevron_back_outline),
          ),
          leadingWidth: 80,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Click on the button ',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w800),
            ),
            const Text(
              'To pick file ',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w800),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: isLoading
                  ? const CircularProgressIndicator()
                  : CustomButton(
                      ontap: () {
                        pickFile();
                      },
                      text: 'Pick File',
                      txtcolor: Colors.black,
                    ),
            ),
            const SizedBox(
              height: 10,
            ),
            if (pickedfile != null)
              Padding(
                padding: const EdgeInsets.all(16),
                child: GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    height: 300,
                    width: 400,
                    child: Image.file(fileTODisplay!),
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => const CustomSuccessDialog(),
                    );
                  },
                ),
              ),
          ],
        ));
  }
}
