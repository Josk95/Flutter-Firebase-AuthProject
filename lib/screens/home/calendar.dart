import 'dart:convert';

import 'package:firebase_auth_app/models/calendar_event.dart';
import 'package:firebase_auth_app/providers/calendar_provider.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  Map<DateTime, List<Event>> selectedEvents = {};
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  TextEditingController _eventController = TextEditingController();

  @override
  void initState() {
    selectedEvents =
        Provider.of<CalendarProvider>(context, listen: false).eventList;

    super.initState();

    _eventController = TextEditingController();
  }

  List<Event> _getEventsfromDay(DateTime date) {
    return Provider.of<CalendarProvider>(context, listen: false)
            .eventList[date] ??
        [];
    //return selectedEvents[date] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('sv');
    print(selectedEvents.toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalender'),
      ),
      body: Column(
        children: [
          _calendar(),
          ..._getEventsfromDay(_selectedDay).map((event) {
            return ListTile(
              trailing: event.isBooked
                  ? const Icon(
                      Icons.lock,
                      color: Colors.red,
                    )
                  : const Icon(
                      Icons.lock,
                      color: Colors.green,
                    ),
              title: Text(
                event.title,
              ),
              onTap: () {
                event.isBooked
                    ? null
                    : showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text('Bekräfta bokning'),
                              content: Text('Tid: ${event.title}'),
                              actions: [
                                TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('Cancel')),
                                TextButton(
                                    onPressed: () {
                                      Provider.of<CalendarProvider>(context,
                                              listen: false)
                                          .bookEvent(event);
                                      Navigator.pop(context);
                                      setState(() {});
                                      //return;
                                    },
                                    child: Text('Boka'))
                              ],
                            ));
              },
            );
          })
        ],
      ),
    );
  }

  Widget _calendar() {
    return TableCalendar(
      locale: 'sv_SE',
      startingDayOfWeek: StartingDayOfWeek.monday,
      focusedDay: _focusedDay,
      firstDay: DateTime.utc(2021, 12, 01),
      lastDay: DateTime(2022),
      eventLoader: _getEventsfromDay,
      calendarFormat: _calendarFormat,
      onFormatChanged: (CalendarFormat _format) {
        setState(() {
          _calendarFormat = _format;
        });
      },
      selectedDayPredicate: (day) {
        // Use `selectedDayPredicate` to determine which day is currently selected.
        // If this returns true, then `day` will be marked as selected.

        // Using `isSameDay` is recommended to disregard
        // the time-part of compared DateTime objects.
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        if (!isSameDay(_selectedDay, selectedDay)) {
          // Call `setState()` when updating the selected day
          setState(() {
            _selectedDay = selectedDay;
            print(_selectedDay);
            print('Användaren klickad på en dag');
            _focusedDay = focusedDay;
          });
        }
      },
      onPageChanged: (focusedDay) {
        // No need to call `setState()` here
        _focusedDay = focusedDay;
      },
    );
  }
}