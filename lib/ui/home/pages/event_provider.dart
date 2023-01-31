import 'package:classroom/ui/home/pages/event_editing_page.dart';
import 'package:classroom/ui/home/pages/home_page.dart';
import 'package:classroom/ui/home/pages/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:googleapis/chat/v1.dart';
import 'package:googleapis/connectors/v1.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'event.dart';
import 'event_editing_page.dart';

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
