import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EventProvider extends ChangeNotifier {
  final List<Appointment> _events = [];
  List<Appointment> get events => _events;

  DateTime _selectedDate = DateTime.now();

  DateTime get selectedDate => _selectedDate;
  void setDate(DateTime date) => _selectedDate = date;
  List<Appointment> get eventsOfSelectedDate => _events;

  void addEvent(Appointment event) {
    _events.add(event);

    notifyListeners();
  }
}
