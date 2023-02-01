import 'package:classroom/ui/home/pages/calendar_page.dart';
import 'package:classroom/ui/home/pages/event_editing_page.dart';
import 'package:classroom/ui/home/pages/event_provider.dart';
import 'package:classroom/ui/home/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'event.dart';
import 'event_editing_page.dart';

class TasksWidget extends StatefulWidget {
  @override
  _TasksWidgetState createState() => _TasksWidgetState();
}

class _TasksWidgetState extends State<TasksWidget> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EventProvider>(context);
    final selectedEvents = provider.eventsOfSelectedDate;

    if (selectedEvents.isEmpty) {
      return Center(
        child: Text(
          'No Events found',
          style: TextStyle(color: Colors.blue),
        ),
      );
    }
    return SfCalendar(
      view: CalendarView.timelineDay,
      dataSource: EventDataSource(provider.events),
      initialDisplayDate: provider.selectedDate,
      appointmentBuilder: appointmentBuilder,
      onTap: (details) {
        if (details.appointments == null) return;
        final event = details.appointments!.first;
      },
      todayHighlightColor: Color(0xff0083B0),
      headerHeight: 0,
    );
  }

  Widget appointmentBuilder(
    BuildContext context,
    CalendarAppointmentDetails details,
  ) {
    final event = details.appointments.first as Appointment;
    return Container(
      width: details.bounds.width,
      height: details.bounds.height,
      decoration: BoxDecoration(
          color: event.color.withOpacity(0.5),
          borderRadius: BorderRadius.circular(12)),
      child: Center(
        child: Text(
          event.subject,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
