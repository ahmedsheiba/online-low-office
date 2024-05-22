import 'package:flutter/material.dart';
import 'package:low_office/helper/meeting.dart';

class MeetingProvider extends ChangeNotifier {
  List<Meeting> meetings = [
    // Meeting('Conference1', DateTime.now(),
    //     DateTime.now().add(Duration(hours: 2)), Color(0xFF0F8644), false),
    // Meeting('Conference1', DateTime.now(),
    //     DateTime.now().add(Duration(hours: 2)), Color(0xFF0F8644), false),
  ];

  void addMeting() {
    meetings.add(Meeting('Conference1', DateTime.now(),
        DateTime.now().add(Duration(hours: 2)), Color(0xFF0F8644), false));
    notifyListeners();
  }

  void editMeeting(int index) {
    meetings[index].eventName = 'con $index $index';
    notifyListeners();
  }
}
