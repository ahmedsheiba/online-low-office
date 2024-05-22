import 'package:low_office/Screens/about.dart';
import 'package:low_office/Screens/calinder.dart';
import 'package:low_office/Screens/case_updatepage.dart';
import 'package:low_office/Screens/chat.dart';
import 'package:low_office/Screens/payment.dart';
import 'package:low_office/Screens/upload.dart';

pageByIndex(int index) {
  switch (index) {
    case 0:
      {
        return AboutPage();
      }
    case 1:
      {
        return const CaseUbdate();
      }
    case 2:
      {
        return const ClinderPage();
      }
    case 3:
      {
        return PaymentPage();
      }
    case 4:
      {
        return ChatPage();
      }
    case 5:
      {
        return const UploadPage();
      }
  }
}
