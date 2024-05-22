import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ionicons/ionicons.dart';
import 'package:low_office/Screens/home_page.dart';
import 'package:low_office/Screens/success.dart';
import 'package:low_office/helper/constant.dart';
import 'package:low_office/model/card.dart';
import 'package:low_office/model/more_item.dart';
import 'package:low_office/widgets/custom_button.dart';
import 'package:low_office/widgets/custom_text_form_field.dart';

class PaymentPage extends StatefulWidget {
  PaymentPage({
    super.key,
  });

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String? caseNum, amount;
  void loadCards() {
    cards.add(CardItem(
        color: const Color(0xff3862F8),
        balance: "5 300.00",
        cardNumber: "**** 2236",
        date: "02/24"));
    cards.add(CardItem(
        color: const Color(0xff060F27),
        balance: "6 322.00",
        cardNumber: "**** 3344",
        date: "03/31"));
    cards.add(CardItem(
        color: const Color(0xff05144f),
        balance: "3 245.00",
        cardNumber: "**** 2456",
        date: "11/26"));
    cards.add(CardItem(
        color: const Color(0xff4f0101),
        balance: "8 311.00",
        cardNumber: "**** 2236",
        date: "09/25"));
  }

  var cards = <CardItem>[];

  var moreItems = <MoreItem>[];

  @override
  void initState() {
    loadCards();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFoucs = FocusScope.of(context);
        if (!currentFoucs.hasPrimaryFocus) {
          currentFoucs.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          shadowColor: Colors.black,
          title: Text(
            'Payment Page',
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
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 18,
                  ),
                  Text(
                    "My accounts",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 23),
                  ),
                  Spacer(),
                  Image(
                    image: AssetImage("assets/notification.png"),
                    width: 23,
                    height: 23,
                  ),
                  SizedBox(
                    width: 20,
                  )
                ],
              ),
              const SizedBox(
                height: 9,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 1),
                  height: 200,
                  child: ListView.builder(
                    itemCount: cards.length,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, top: 10, bottom: 10),
                        child: Container(
                          width: 300,
                          height: 200,
                          decoration: BoxDecoration(
                            boxShadow: kElevationToShadow[4],
                            borderRadius: BorderRadius.circular(15.0),
                            color: cards[index].color,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  const Image(
                                    image: AssetImage("assets/master.png"),
                                    height: 40,
                                    width: 40,
                                    fit: BoxFit.fill,
                                  ),
                                  const SizedBox(
                                    width: 17,
                                  ),
                                  Text(
                                    cards[index].cardNumber,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Spacer(),
                                  Text(
                                    cards[index].date,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.white),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  )
                                ],
                              ),
                              const Spacer(),
                              const Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "balance",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                        fontSize: 15.5),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "\$ ${cards[index].balance}",
                                    style: const TextStyle(
                                        fontSize: 27,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16, left: 16),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    CustomTextFormField(
                        onChanged: (data) {
                          amount = data;
                        },
                        hinttext: 'Amount'),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SuccessPage(),
                            ),
                          );
                        },
                        child: CustomButton(
                            color: Theme.of(context).colorScheme.secondary,
                            text: 'Pay')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
