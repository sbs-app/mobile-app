// ignore_for_file: deprecated_member_use

import 'package:classroom/ui/home/pages/calendar/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'event_provider.dart';

class EventEditingPage extends StatefulWidget {
  const EventEditingPage({
    super.key,
  });

  @override
  _EventEditingPageState createState() => _EventEditingPageState();
}

class _EventEditingPageState extends State<EventEditingPage> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  late DateTime fromDate;
  late DateTime toDate;

  @override
  void initState() {
    super.initState();
    fromDate = DateTime.now();
    toDate = DateTime.now().add(Duration(hours: 2));
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: CloseButton(),
          actions: buildEditingActions(),
        ),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(12),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                buildTitle(),
                SizedBox(height: 12),
                buildDateTimePicker(),
              ],
            ),
          ),
        ),
      );

  List<Widget> buildEditingActions() => [
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          onPressed: saveForm,
          icon: Icon(Icons.done),
          label: Text("Save".toUpperCase()),
        )
      ];

  Widget buildTitle() => TextFormField(
        style: TextStyle(color: Colors.white, fontSize: 24),
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          hintText: "Add Title",
        ),
        onFieldSubmitted: (_) => saveForm(),
        validator: (title) =>
            title != null && title.isEmpty ? 'Do not leave title empty!' : null,
        controller: titleController,
      );

  Widget buildDateTimePicker() => Column(
        children: [
          buildFrom(),
          buildTo(),
        ],
      );

  Widget buildFrom() => buildHeader(
        header: 'FROM',
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: buildDropdownField(
                text: Utils.toDate(fromDate),
                onClicked: () => pickFromDateTime(pickDate: true),
              ),
            ),
            Expanded(
              child: buildDropdownField(
                text: Utils.toTime(fromDate),
                onClicked: () => pickFromDateTime(pickDate: false),
              ),
            ),
          ],
        ),
      );

  Widget buildTo() => buildHeader(
        header: 'TO',
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: buildDropdownField(
                text: Utils.toDate(toDate),
                onClicked: () => pickFromToDateTime(pickDate: true),
              ),
            ),
            Expanded(
              child: buildDropdownField(
                text: Utils.toTime(toDate),
                onClicked: () {
                  pickFromToDateTime(pickDate: false);
                },
              ),
            ),
          ],
        ),
      );

  Future pickFromDateTime({required bool pickDate}) async {
    final date = await pickDateTime(fromDate, pickDate: pickDate);
    if (date == null) return;

    if (date.isAfter(toDate)) {
      toDate =
          DateTime(date.year, date.month, date.day, toDate.hour, toDate.minute);
    }

    setState(() => fromDate = date);
  }

  Future pickFromToDateTime({required bool pickDate}) async {
    final date = await pickDateTime(
      toDate,
      pickDate: pickDate,
      firstDate: pickDate ? fromDate : null,
    );
    if (date == null) return;

    if (date.isAfter(toDate)) {
      toDate =
          DateTime(date.year, date.month, date.day, toDate.hour, toDate.minute);
    }

    setState(() => toDate = date);
  }

  Future<DateTime?> pickDateTime(
    DateTime initialDate, {
    required bool pickDate,
    DateTime? firstDate,
  }) async {
    if (pickDate) {
      final date = await showDatePicker(
          helpText: 'SELECT DATE',
          builder: (context, child) => Theme(
                data: ThemeData().copyWith(
                    colorScheme: ColorScheme.dark(
                        primary: Color(0xffFF045F),
                        onPrimary: Colors.white,
                        onSurface: Color.fromARGB(255, 137, 217, 252),
                        //onSurface: Color(0xffFF045F),
                        surface: Color.fromARGB(255, 0, 0, 0)),
                    textTheme: TextTheme(
                        overline: TextStyle(
                      fontSize: 14,
                      color: Colors.red,
                    )),
                    dialogBackgroundColor: Color.fromARGB(255, 8, 8, 8)),
                child: child!,
              ),
          context: context,
          initialDate: initialDate,
          firstDate: firstDate ?? DateTime(1900),
          lastDate: DateTime(9999));
      if (date == null) return null;
      final time = Duration(
        hours: initialDate.hour,
        minutes: initialDate.minute,
      );
      return date.add(time);
    } else {
      final timeOfDay = await showTimePicker(
          helpText: 'SELECT TIME',
          builder: (context, child) => Theme(
                data: ThemeData().copyWith(
                    colorScheme: ColorScheme.dark(
                        primary: Color(0xffF0C38E),
                        onPrimary: Colors.white,
                        onSurface: Color.fromARGB(255, 137, 217, 252),
                        //onSurface: Color(0xffFF045F),
                        surface: Color(0xff312c51)),
                    textTheme: TextTheme(
                        overline: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    )),
                    dialogBackgroundColor: Color(0xff312c51)),
                child: child!,
              ),
          context: context,
          initialTime: TimeOfDay.fromDateTime(initialDate));
      if (timeOfDay == null) return null;
      final date =
          DateTime(initialDate.year, initialDate.month, initialDate.day);
      final time = Duration(
        hours: timeOfDay.hour,
        minutes: timeOfDay.minute,
      );
      return date.add(time);
    }
  }

  Widget buildDropdownField({
    required String text,
    required Function()? onClicked,
  }) =>
      ListTile(
        title: Text(text, style: const TextStyle(color: Colors.white)),
        trailing: Icon(Icons.arrow_drop_down),
        onTap: onClicked,
      );

  Widget buildHeader({
    required String header,
    required Widget child,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            header,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          child,
        ],
      );

  Future saveForm() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final event = Appointment(
        subject: titleController.text,
        startTime: fromDate,
        endTime: toDate,
        isAllDay: false,
      );
      final provider = Provider.of<EventProvider>(context, listen: false);
      provider.addEvent(event);
      Navigator.of(context).pop();
    }
  }
}
