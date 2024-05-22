import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:low_office/Screens/home_page.dart';
import 'package:low_office/model/message_model.dart';
import 'package:low_office/widgets/caht-bubble.dart';

// ignore: must_be_immutable
class ChatPage extends StatelessWidget {
  ChatPage({
    super.key,
  });

  static String id = 'ChatPage';
  final scrollcontroller = ScrollController();
  CollectionReference message =
      FirebaseFirestore.instance.collection('message');
  TextEditingController controller = TextEditingController();
  final TextEditingController _textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: message.orderBy('CreatedAt', descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Message> messageList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messageList.add(
                Message.fromJson(
                  snapshot.data!.docs[i],
                ),
              );
            }
            return Scaffold(
              backgroundColor: Theme.of(context).colorScheme.background,
              appBar: AppBar(
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
                automaticallyImplyLeading: false,
                backgroundColor: Theme.of(context).colorScheme.primary,
                title:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Image.asset(
                    'assets/logo2.png',
                    height: 50,
                  ),
                  const Text(
                    'Chat',
                    style: TextStyle(
                        fontFamily: 'pacifico',
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        reverse: true,
                        controller: scrollcontroller,
                        itemCount: messageList.length,
                        itemBuilder: (context, index) {
                          return messageList[index].id == HomePage.email
                              ? Chatbubble(message: messageList[index])
                              : ChatbubbleRecever(message: messageList[index]);
                        }),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: TextField(
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      controller: controller,
                      onSubmitted: (data) {
                        message.add(
                          {
                            'message': data,
                            'CreatedAt': DateTime.now(),
                            'id': HomePage.email,
                          },
                        );
                        controller.clear();
                        scrollcontroller.animateTo(
                          0,
                          duration: const Duration(seconds: 2),
                          curve: Curves.easeIn,
                        );
                      },
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () {
                            _sendMessage(controller.text);
                          },
                          child: Icon(
                            Icons.send,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        hintText: 'Send Message...',
                        hintStyle: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontFamily: 'pacifico',
                            fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return const Text('no');
        });
  }

  void _sendMessage(String messageText) {
    if (messageText.isNotEmpty) {
      message.add({
        'message': messageText,
        'CreatedAt': DateTime.now(),
        'id': HomePage.email,
      });
      controller.clear();
      scrollcontroller.animateTo(
        0,
        duration: const Duration(seconds: 2),
        curve: Curves.easeIn,
      );
    }
  }
}
