import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:low_office/Screens/home_page.dart';
import 'package:low_office/helper/constant.dart';
import 'package:low_office/helper/meeting_provider.dart';
import 'package:low_office/helper/metting_data_source.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class ClinderPage extends StatefulWidget {
  const ClinderPage({super.key});

  @override
  State<ClinderPage> createState() => _ClinderPageState();
}

class _ClinderPageState extends State<ClinderPage> {
  // List<Meeting> getDataSource() {
  // //   final List<Meeting> meetings = <Meeting>[];
  // //   final DateTime today = DateTime.now();
  // //   final DateTime startTime =
  // //       DateTime(today.year, today.month, today.day, 9, 0, 0);
  // //   final DateTime endTime = startTime.add(const Duration(hours: 2));

  // //   meetings.add(
  // //       Meeting('Conference1', startTime, endTime, Color(0xFF0F8644), false));
  // //   meetings.add(
  // //       Meeting('Conference2', startTime, endTime, Color(0xFF0F8644), false));
  // //   meetings.add(
  // //       Meeting('Conference3', startTime, endTime, Color(0xFF0F8644), false));

  // //   return meetings;
  // // }

  CalendarView calendarView = CalendarView.month;
  CalendarController calendarController = CalendarController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MeetingProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        shadowColor: Colors.black,
        title: Text(
          'Calendar',
          style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.bold,
              fontFamily: 'Pacifico'),
        ),
        actions: [
          IconButton(
              onPressed: () {
                provider.addMeting();
              },
              icon: const Icon(Icons.add)),
          IconButton(
              onPressed: () {
                provider.editMeeting(0);
              },
              icon: const Icon(Icons.edit))
        ],
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
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                  onPressed: () {
                    setState(() {
                      calendarView = CalendarView.month;
                      calendarController.view = calendarView;
                    });
                  },
                  child: const Text('Month View')),
              OutlinedButton(
                  onPressed: () {
                    setState(() {
                      calendarView = CalendarView.week;
                      calendarController.view = calendarView;
                    });
                  },
                  child: const Text('Week View')),
              OutlinedButton(
                  onPressed: () {
                    setState(() {
                      calendarView = CalendarView.day;
                      calendarController.view = calendarView;
                    });
                  },
                  child: const Text('Day View')),
            ],
          ),
          Expanded(
            child: Container(
                height: 800,
                child: SfCalendar(
                  view: calendarView,
                  initialSelectedDate: DateTime.now(),
                  controller: calendarController,
                  dataSource: MeetingDataSource(provider.meetings),
                  monthViewSettings: const MonthViewSettings(
                    appointmentDisplayMode:
                        MonthAppointmentDisplayMode.indicator,
                    showAgenda: true,
                  ),
                  showNavigationArrow: true,
                  showWeekNumber: true,
                  weekNumberStyle: const WeekNumberStyle(
                    backgroundColor: Colors.red,
                    textStyle: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  firstDayOfWeek: 5,
                  todayHighlightColor: Colors.red,
                  cellBorderColor: Colors.orange,
                  selectionDecoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.deepOrange, width: 4),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    shape: BoxShape.rectangle,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
