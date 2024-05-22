import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ionicons/ionicons.dart';
import 'package:low_office/Screens/home_page.dart';
import 'package:low_office/helper/constant.dart';

// ignore: must_be_immutable
class AboutPage extends StatelessWidget {
  AboutPage({super.key, this.height, this.width});
  // ignore: prefer_typing_uninitialized_variables
  var height, width;

  List skills = [
    "- Analytical and research skills",
    "- Attention to detail",
    "- Organizational skills",
    "- Time management",
  ];
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
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
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).colorScheme.background,
          height: height,
          width: width,
          child: Column(
            children: [
              Container(
                height: height * 0.25,
                width: width,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 45, left: 20, right: 20),
                        child: Row(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                image: const DecorationImage(
                                  image: AssetImage(
                                    "assets/manicon.png",
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Ahmed Sheiba',
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Profile',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          letterSpacing: 1),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.phone,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 7),
                                          child: Text(
                                            '01556355809',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                fontSize: 20,
                                                letterSpacing: 1),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.mail,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 7),
                                          child: Text(
                                            'sheibaahmed2@gmail.com',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                fontSize: 15,
                                                letterSpacing: 1),
                                          ),
                                        )
                                      ],
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 30,
                          left: 30,
                        ),
                      ),
                    ]),
              ),
              SingleChildScrollView(
                child: Container(
                  height: height * 0.75,
                  width: width,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(60))),
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                childAspectRatio: 3.3,
                                mainAxisSpacing: 15),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: skills.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {},
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(50),
                                      bottomLeft: Radius.circular(50)),
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black38,
                                        spreadRadius: 6,
                                        blurRadius: 6)
                                  ]),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      skills[index],
                                      style: const TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ]),
                            ),
                          );
                        }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
