import 'package:flutter/material.dart';
import 'package:studentapp/controllers/controllers.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:provider/provider.dart';

class CalendarUI extends StatelessWidget {
  CalendarUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_sharp),
          color: Colors.white,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Calendar",
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff0f0c29),
        elevation: 0,
      ),
      body: SfCalendar(
        backgroundColor: Color(0xff0f0c29),
        view: CalendarView.month,
        cellBorderColor: Colors.transparent,
        allowedViews: <CalendarView>[
          CalendarView.day,
          CalendarView.week,
          CalendarView.workWeek,
          CalendarView.month,
          CalendarView.timelineDay,
          CalendarView.timelineWeek,
          CalendarView.timelineWorkWeek,
          CalendarView.timelineMonth,
          CalendarView.schedule
        ],
        headerStyle: CalendarHeaderStyle(
            textStyle: TextStyle(
                fontFamily: 'SyneTactile',
                color: Color.fromARGB(255, 255, 155, 119))),
        viewHeaderStyle: ViewHeaderStyle(
            dayTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'SyneTactile',
                color: Color.fromARGB(255, 242, 242, 125)),
            dateTextStyle:
                TextStyle(fontFamily: 'SyneTactile', color: Colors.white)),
        appointmentTextStyle:
            TextStyle(color: Color.fromARGB(255, 238, 237, 237)),
        monthViewSettings: MonthViewSettings(
            showAgenda: true,
            monthCellStyle: MonthCellStyle(
                textStyle: TextStyle(
                    fontFamily: 'SyneTactile',
                    color: Color.fromARGB(255, 241, 238, 238)),
                leadingDatesTextStyle: TextStyle(
                    fontFamily: 'SyneTactile',
                    color: Color.fromARGB(255, 247, 135, 135)),
                trailingDatesTextStyle: TextStyle(
                    fontFamily: 'SyneTactile',
                    color: Color.fromARGB(255, 247, 135, 135))),
            agendaStyle: AgendaStyle(
                dayTextStyle: TextStyle(
                    fontFamily: 'SyneTactile',
                    color: Color.fromARGB(255, 243, 240, 240)),
                dateTextStyle: TextStyle(
                    fontFamily: 'SyneTactile',
                    color: Color.fromARGB(255, 238, 234, 234)),
                appointmentTextStyle: TextStyle(
                    fontFamily: 'SyneTactile',
                    color: Color.fromARGB(255, 243, 238, 238)))),
        initialSelectedDate: DateTime.now(),
        todayHighlightColor: Color.fromARGB(255, 11, 216, 165),
        showNavigationArrow: true,
      ),
    );
  }
}
