import 'package:flutter/material.dart';
import 'package:low_office/Screens/profile.dart';
import 'package:low_office/helper/switch_page.dart';
import 'package:low_office/widgets/my_drawer.dart';

// import 'package:sidebarx/sidebarx.dart';
// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({
    super.key,
    this.height,
    this.width,
  });
  static String id = 'HomePage';
  var height, width;

  List imageData = [
    "assets/about.png",
    "assets/Update.png",
    "assets/calinder.png",
    "assets/payment.png",
    "assets/chat.png",
    "assets/upload.png",
  ];

  static var email;

  List titels = [
    "About",
    "Case Update",
    "Calinder",
    "Payment",
    "Chat",
    "Upload",
  ];

  @override
  Widget build(BuildContext context) {
    email = ModalRoute.of(context)!.settings.arguments;

    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        shadowColor: Colors.black,
        title: Text(
          'Home Page',
          style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.bold,
              fontFamily: 'Pacifico'),
        ),
      ),
      drawer: const Drawer(
        child: MyDrawer(),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).colorScheme.background,
          height: height,
          width: width,
          child: Column(children: [
            Container(
              height: height * 0.25,
              width: width,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 30, left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.home,
                              color: Theme.of(context).colorScheme.secondary,
                              size: 40,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProfilePage(),
                                ),
                              );
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Theme.of(context).colorScheme.primary,
                                  image: const DecorationImage(
                                      image: AssetImage("assets/manicon.png"))),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        left: 30,
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Low Office',
                              style: TextStyle(
                                  fontSize: 30,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Dashboard',
                              style: TextStyle(
                                  fontSize: 16,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  letterSpacing: 1),
                            )
                          ]),
                    ),
                  ]),
            ),
            SingleChildScrollView(
              child: Container(
                height: height * 0.75,
                width: width,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                padding: const EdgeInsets.only(bottom: 20),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.1,
                      mainAxisSpacing: 15),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: imageData.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => pageByIndex(index),
                            ));
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white10,
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black38,
                                  spreadRadius: 3,
                                  blurRadius: 6)
                            ]),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                imageData[index],
                                width: 100,
                              ),
                              Text(
                                titels[index],
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Pacifico'),
                              )
                            ]),
                      ),
                    );
                  },
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
