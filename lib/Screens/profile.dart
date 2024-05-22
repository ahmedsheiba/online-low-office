import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';
import 'package:low_office/Screens/about.dart';
import 'package:low_office/Screens/home_page.dart';
import 'package:low_office/helper/constant.dart';
import 'package:low_office/helper/image_picker.dart';
import 'package:low_office/widgets/profiletile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Uint8List? image;

  void _selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    image = img;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        shadowColor: Colors.black,
        title: const Text(
          'Profile Page',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Pacifico'),
        ),
        leading: IconButton(
          color: Colors.white,
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
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          Stack(children: [
            image != null
                ? CircleAvatar(
                    radius: 80,
                    backgroundImage: MemoryImage(image!),
                  )
                : CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    radius: 80,
                    backgroundImage: const AssetImage('assets/manicon.png'),
                  ),
            Positioned(
              bottom: -10,
              left: 120,
              child: IconButton(
                onPressed: _selectImage,
                icon: const Icon(
                  Icons.add_a_photo,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ]),
          const SizedBox(
            height: 30,
          ),
          profileTile(
              'Name',
              'Ahmed Sheiba',
              CupertinoIcons.person,
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary, () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AboutPage(),
              ),
            );
          }),
          const SizedBox(
            height: 40,
          ),
          profileTile(
              'Phone',
              '01556355809',
              CupertinoIcons.phone,
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary, () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AboutPage(),
              ),
            );
          }),
          const SizedBox(
            height: 40,
          ),
          profileTile(
              'Adress',
              'Damanhour',
              CupertinoIcons.location,
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary, () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AboutPage(),
              ),
            );
          }),
          const SizedBox(
            height: 40,
          ),
          profileTile(
              'E-mail',
              'sheibaahmed2@gmail.com',
              CupertinoIcons.mail,
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary, () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AboutPage(),
              ),
            );
          }),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shadowColor: Colors.white,
                    backgroundColor: Colors.deepOrange,
                    padding: const EdgeInsets.all(15)),
                child: const Text(
                  'Edit Profile',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Pacifico',
                      fontWeight: FontWeight.bold),
                )),
          ),
        ]),
      ),
    );
  }
}
