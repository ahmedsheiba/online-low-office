import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:low_office/Screens/home_page.dart';
import 'package:low_office/Screens/register.dart';
import 'package:low_office/helper/constant.dart';
import 'package:low_office/helper/show_snak_bar.dart';
import 'package:low_office/widgets/custom_button.dart';
import 'package:low_office/widgets/custom_text_form_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// import '../widget/custom_text_field.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});
  static String id = 'LoginPage';
  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool isLoading = false;
  String? email, password;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
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
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.grey.shade900,
            body: PageView(
              children: [
                Padding(
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
                              'LOGIN',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Pacifico'),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextFormField(
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
                              if (formKey.currentState!.validate()) {
                                isLoading = true;
                                setState(() {});
                                try {
                                  await loginUser();
                                  showSnackBar(context, 'Success');
                                  Navigator.pushNamed(context, HomePage.id,
                                      arguments: email);
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'user-not-found') {
                                    showSnackBar(context, 'user not found');
                                  } else if (e.code == 'wrong-password') {
                                    showSnackBar(context,
                                        'Wrong password provided for that user.');
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
                            text: 'Log in'),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don\'t have an account?',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, RegisterPage.id);
                              },
                              child: const Text(
                                '  Register',
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
                ),
              ],
            )),
      ),
    );
  }

  Future<void> loginUser() async {
    // ignore: unused_local_variable
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
