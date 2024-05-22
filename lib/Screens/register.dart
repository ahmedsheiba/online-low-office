import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:low_office/Screens/home_page.dart';
import 'package:low_office/helper/constant.dart';
import 'package:low_office/helper/register_controller.dart';
import 'package:low_office/helper/show_snak_bar.dart';
import 'package:low_office/model/user_model.dart';
import 'package:low_office/widgets/custom_button.dart';
import 'package:low_office/widgets/custom_text_form_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  static String id = 'RegisterPage';
  @override
  State<RegisterPage> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterPage> {
  bool isLoading = false;
  String? email;
  String? password;
  String? name;
  String? phone;
  String? address;

  GlobalKey<FormState> formKey = GlobalKey();
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFoucs = FocusScope.of(context);
          if (!currentFoucs.hasPrimaryFocus) {
            currentFoucs.unfocus();
          }
        },
        child: Scaffold(
            backgroundColor: Colors.grey.shade900,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const Spacer(flex: 1),
                    CircleAvatar(
                      backgroundColor: kPrimaryColor,
                      radius: 60,
                      backgroundImage: const AssetImage('assets/logo2.png'),
                    ),
                    const Text(
                      'Low Office',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'pacifico'),
                    ),
                    const Spacer(flex: 1),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'REGISTER',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              fontFamily: 'Pacifico'),
                        ),
                      ],
                    ),
                    // const SizedBox(
                    //   height: 15,
                    // ),
                    // CustomTextFormField(
                    //     controller: HomePage.email,
                    //     onChanged: (data) {
                    //       name = data;
                    //     },
                    //     hinttext: 'Name'),
                    // const SizedBox(
                    //   height: 15,
                    // ),
                    // CustomTextFormField(
                    //     controller: HomePage.email,
                    //     onChanged: (data) {
                    //       phone = data;
                    //     },
                    //     hinttext: 'Phone'),
                    // const SizedBox(
                    //   height: 15,
                    // ),
                    // CustomTextFormField(
                    //     controller: HomePage.email,
                    //     onChanged: (data) {
                    //       address = data;
                    //     },
                    //     hinttext: 'Address'),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                        controller: HomePage.email,
                        onChanged: (data) {
                          email = data;
                        },
                        hinttext: 'Email'),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                        obscureText: true,
                        onChanged: (data) {
                          password = data;
                        },
                        hinttext: 'Password'),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomButton(
                        ontap: () async {
                          final user = UserModel(
                              id: email,
                              name: controller.name.text.trim(),
                              phone: controller.phone.text.trim(),
                              address: controller.address.text.trim());
                          if (formKey.currentState!.validate()) {
                            isLoading = true;
                            setState(() {});
                            try {
                              await registerUser();
                              showSnackBar(context, 'Success');
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                showSnackBar(context, 'weak password');
                              } else if (e.code == 'email-already-in-use') {
                                // ignore: use_build_context_synchronously
                                showSnackBar(context,
                                    'The account already exists for that email.');
                              }
                            } catch (e) {
                              print(e);
                              showSnackBar(context, 'There was an Error!');
                            }
                          }
                          isLoading = false;
                          setState(() {});
                        },
                        color: Colors.brown,
                        txtcolor: Colors.white,
                        text: 'Register'),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account?',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            '  LOGIN',
                            style: TextStyle(
                              color: Color(0XFFd3f5f5),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                    const Spacer(flex: 3),
                  ],
                ),
              ),
            )),
      ),
    );
  }

  Future<void> registerUser() async {
    // ignore: unused_local_variable
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
