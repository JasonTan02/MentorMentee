import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_event_calendar/flutter_event_calendar.dart';
import '../../injection.dart';
import '../../model/calendar_event_model.dart';

class EventCalendarPage extends StatefulWidget {
  const EventCalendarPage({Key? key}) : super(key: key);

  @override
  State<EventCalendarPage> createState() => _EventCalendarPageState();
}

class _EventCalendarPageState extends State<EventCalendarPage> {
  StreamController<CalendarEventModel> streamController =
      getit<StreamController<CalendarEventModel>>();
  CalendarEventModel calendarEventModel = getit<CalendarEventModel>();
  @override
  void initState() {
    streamController.stream.listen((event) {
      calendarEventModel = event;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return EventCalendar(
      specialDays: calendarEventModel.specialDays,
      showLoadingForEvent: true,
      calendarType: calendarEventModel.calendarType,
      calendarLanguage: calendarEventModel.calendarLanguage,
      calendarOptions: CalendarOptions(
          viewType: calendarEventModel.calendarOptions.viewType,
          headerMonthBackColor:
              calendarEventModel.calendarOptions.headerMonthBackColor,
          toggleViewType: calendarEventModel.calendarOptions.toggleViewType,
          font: calendarEventModel.calendarOptions.font),
      dayOptions: DayOptions(
          selectedBackgroundColor:
              calendarEventModel.dayOptions.selectedBackgroundColor),
      headerOptions: HeaderOptions(
        headerTextColor: calendarEventModel.headerOptions.headerTextColor,
        navigationColor: calendarEventModel.headerOptions.navigationColor,
        monthStringType: calendarEventModel.headerOptions.monthStringType,
        weekDayStringType: calendarEventModel.headerOptions.weekDayStringType,
      ),
    );
  }
}
