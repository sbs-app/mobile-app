import 'package:classroom/ui/home/pages/event_editing_page.dart';
import 'package:classroom/ui/home/pages/event_provider.dart';
import 'package:classroom/ui/home/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'TaskWidgets.dart';
import 'event.dart';
import 'event_editing_page.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final events = Provider.of<EventProvider>(context).events;

    if (!events.contains(_getCalendarDataSource()[0])) {
      events.addAll(_getCalendarDataSource());
    }

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Color(0xff00B4DB),
          onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => EventEditingPage())),
        ),
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Colors.transparent,
                            ),
                          ),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Calendar".toUpperCase(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SfCalendar(
                  backgroundColor: Colors.black,
                  view: CalendarView.month,
                  dataSource: EventDataSource(events),
                  cellBorderColor: const Color.fromARGB(0, 87, 15, 15),
                  onLongPress: (details) {
                    final provider =
                        Provider.of<EventProvider>(context, listen: false);

                    provider.setDate(details.date!);
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => TasksWidget(),
                    );
                  },
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
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  viewHeaderStyle: const ViewHeaderStyle(
                    dayTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff00B4DB),
                    ),
                    dateTextStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  appointmentTextStyle: const TextStyle(
                    color: Color.fromARGB(255, 238, 237, 237),
                  ),
                  monthViewSettings: const MonthViewSettings(
                    showAgenda: true,
                    monthCellStyle: MonthCellStyle(
                      textStyle: TextStyle(
                        color: Color.fromARGB(255, 241, 238, 238),
                      ),
                      leadingDatesTextStyle: TextStyle(
                        color: Color.fromARGB(255, 151, 194, 224),
                      ),
                      trailingDatesTextStyle: TextStyle(
                        color: Color.fromARGB(255, 151, 194, 224),
                      ),
                    ),
                    agendaStyle: AgendaStyle(
                      dayTextStyle: TextStyle(
                        color: Color.fromARGB(255, 243, 240, 240),
                      ),
                      dateTextStyle: TextStyle(
                        color: Color.fromARGB(255, 238, 234, 234),
                      ),
                      appointmentTextStyle: TextStyle(
                        color: Color.fromARGB(255, 243, 238, 238),
                      ),
                    ),
                  ),
                  initialSelectedDate: DateTime.now(),
                  todayHighlightColor: const Color(0xff0DF5E3),
                  showNavigationArrow: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EventDataSource extends CalendarDataSource {
  EventDataSource(List<Appointment> appointments) {
    this.appointments = appointments;
    // appointments.addAll(_getCalendarDataSource());
    Event getEvent(int index) => appointments[index] as Event;

    @override
    DateTime getStartTime(int index) => getEvent(index).from;
    @override
    DateTime getEndTime(int index) => getEvent(index).to;
    @override
    String getSubject(int index) => getEvent(index).title;

    @override
    Color getColor(int index) => getEvent(index).backgroundColor;
    @override
    bool isAllDay(int index) => getEvent(index).isAllDay;
  }
}

List<Appointment> _getCalendarDataSource() {
  final List<Appointment> appointments = <Appointment>[];
  appointments.add(
    Appointment(
      startTime: DateTime(2023, 1, 4),
      endTime: DateTime(2023, 1, 4),
      subject: 'Teacher Planning/Staff Development/Student Holiday',
      color: const Color.fromARGB(255, 243, 136, 14),
      isAllDay: true,
    ),
  );
  appointments.add(
    Appointment(
      startTime: DateTime(2023, 1, 5),
      endTime: DateTime(2023, 1, 5),
      subject: 'First Day of 2nd Semester',
      color: const Color.fromARGB(255, 14, 136, 243),
      isAllDay: true,
    ),
  );
  appointments.add(
    Appointment(
      startTime: DateTime(2023, 1, 16),
      endTime: DateTime(2023, 1, 16),
      subject: 'MLK Jr. Day',
      color: const Color.fromARGB(255, 110, 193, 110),
      isAllDay: true,
    ),
  );
  appointments.add(
    Appointment(
      startTime: DateTime(2023, 2, 3),
      endTime: DateTime(2023, 2, 3),
      subject: 'DLD Day',
      color: const Color.fromARGB(255, 158, 21, 21),
      isAllDay: true,
    ),
  );
  appointments.add(
    Appointment(
      startTime: DateTime(2023, 2, 16),
      endTime: DateTime(2023, 2, 20),
      subject: 'Student/Teacher Holiday',
      color: const Color.fromARGB(255, 110, 193, 110),
      isAllDay: true,
    ),
  );
  appointments.add(
    Appointment(
      startTime: DateTime(2023, 3, 17),
      endTime: DateTime(2023, 3, 17),
      subject: 'DLD Day',
      color: const Color.fromARGB(255, 158, 21, 21),
      isAllDay: true,
    ),
  );
  appointments.add(
    Appointment(
      startTime: DateTime(2023, 4, 3),
      endTime: DateTime(2023, 4, 7),
      subject: 'Spring Break',
      color: const Color.fromARGB(255, 110, 193, 110),
      isAllDay: true,
    ),
  );
  appointments.add(
    Appointment(
      startTime: DateTime(2023, 5, 24),
      endTime: DateTime(2023, 5, 24),
      subject: 'Last Day of School',
      color: const Color.fromARGB(255, 233, 201, 86),
      isAllDay: true,
    ),
  );
  appointments.add(
    Appointment(
      startTime: DateTime(2023, 5, 22),
      endTime: DateTime(2023, 5, 24),
      subject: 'High School Early Release/ Final Exams',
      color: const Color.fromARGB(255, 184, 136, 246),
      isAllDay: true,
    ),
  );

  return appointments;
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
