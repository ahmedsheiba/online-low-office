import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:low_office/Screens/home_page.dart';
import 'package:low_office/Screens/log_in.dart';
import 'package:low_office/Screens/register.dart';
import 'package:low_office/Screens/splash_screen.dart';
import 'package:low_office/firebase_options.dart';
import 'package:low_office/helper/meeting_provider.dart';
import 'package:low_office/helper/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(), child: const LowOffice()));
}

class LowOffice extends StatelessWidget {
  const LowOffice({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MeetingProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          LogInScreen.id: (context) => const LogInScreen(),
          RegisterPage.id: (context) => const RegisterPage(),
          HomePage.id: (context) => HomePage(),
        },
        home: const Scaffold(body: SplashScreen()),
        theme: Provider.of<ThemeProvider>(context).themeData,
      ),
    );
  }
}
