import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarUI extends StatelessWidget {
  const CalendarUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_sharp),
          color: Colors.white,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          "Calendar",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xff0f0c29),
        elevation: 0,
      ),
      body: SfCalendar(
        backgroundColor: const Color(0xff0f0c29),
        view: CalendarView.month,
        dataSource: _getCalendarDataSource(),
        cellBorderColor: Colors.transparent,
        allowedViews: const <CalendarView>[
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
        headerStyle: const CalendarHeaderStyle(
            textStyle: TextStyle(
                fontFamily: 'SyneTactile',
                color: Color.fromARGB(255, 125, 150, 242))),
        viewHeaderStyle: const ViewHeaderStyle(
            dayTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'SyneTactile',
                color: Color.fromARGB(255, 125, 150, 242)),
            dateTextStyle:
                TextStyle(fontFamily: 'SyneTactile', color: Colors.white)),
        appointmentTextStyle:
            const TextStyle(color: Color.fromARGB(255, 238, 237, 237)),
        monthViewSettings: const MonthViewSettings(
            showAgenda: true,
            monthCellStyle: MonthCellStyle(
                textStyle: TextStyle(
                    fontFamily: 'SyneTactile',
                    color: Color.fromARGB(255, 241, 238, 238)),
                leadingDatesTextStyle: TextStyle(
                    fontFamily: 'SyneTactile',
                    color: Color.fromARGB(255, 151, 194, 224)),
                trailingDatesTextStyle: TextStyle(
                    fontFamily: 'SyneTactile',
                    color: Color.fromARGB(255, 151, 194, 224))),
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
        todayHighlightColor: const Color.fromARGB(255, 253, 198, 121),
        showNavigationArrow: true,
      ),
    );
  }
}

_AppointmentDataSource _getCalendarDataSource() {
  List<Appointment> appointments = <Appointment>[];
  appointments.add(Appointment(
    startTime: DateTime(2023, 1, 4),
    endTime: DateTime(2023, 1, 4),
    subject: 'Teacher Planning/Staff Development/Student Holiday',
    color: const Color.fromARGB(255, 243, 136, 14),
    isAllDay: true,
  ));
  appointments.add(Appointment(
    startTime: DateTime(2023, 1, 5),
    endTime: DateTime(2023, 1, 5),
    subject: 'First Day of 2nd Semester',
    color: const Color.fromARGB(255, 14, 136, 243),
    isAllDay: true,
  ));
  appointments.add(Appointment(
    startTime: DateTime(2023, 1, 16),
    endTime: DateTime(2023, 1, 16),
    subject: 'MLK Jr. Day',
    color: const Color.fromARGB(255, 110, 193, 110),
    isAllDay: true,
  ));
  appointments.add(Appointment(
    startTime: DateTime(2023, 2, 3),
    endTime: DateTime(2023, 2, 3),
    subject: 'DLD Day',
    color: const Color.fromARGB(255, 158, 21, 21),
    isAllDay: true,
  ));
  appointments.add(Appointment(
    startTime: DateTime(2023, 2, 16),
    endTime: DateTime(2023, 2, 20),
    subject: 'Student/Teacher Holiday',
    color: const Color.fromARGB(255, 110, 193, 110),
    isAllDay: true,
  ));
  appointments.add(Appointment(
    startTime: DateTime(2023, 3, 17),
    endTime: DateTime(2023, 3, 17),
    subject: 'DLD Day',
    color: const Color.fromARGB(255, 158, 21, 21),
    isAllDay: true,
  ));
  appointments.add(Appointment(
    startTime: DateTime(2023, 4, 3),
    endTime: DateTime(2023, 4, 7),
    subject: 'Spring Break',
    color: const Color.fromARGB(255, 110, 193, 110),
    isAllDay: true,
  ));
  appointments.add(Appointment(
    startTime: DateTime(2023, 5, 24),
    endTime: DateTime(2023, 5, 24),
    subject: 'Last Day of School',
    color: const Color.fromARGB(255, 233, 201, 86),
    isAllDay: true,
  ));
  appointments.add(Appointment(
    startTime: DateTime(2023, 5, 22),
    endTime: DateTime(2023, 5, 24),
    subject: 'High School Early Release/ Final Exams',
    color: const Color.fromARGB(255, 184, 136, 246),
    isAllDay: true,
  ));

  return _AppointmentDataSource(appointments);
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}

// MeetingDataSource _getCalendarDataSource() {
//   List<Meeting> meetings = <Meeting>[];
//   meetings.add(Meeting(
//       eventName: 'meeting',
//       from: DateTime(2019, 12, 18, 10),
//       to: DateTime(2019, 12, 18, 12),
//       background: Colors.green,
//       isAllDay: false));

//   return MeetingDataSource(meetings);
// }