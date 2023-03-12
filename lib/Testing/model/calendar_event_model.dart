import 'package:equatable/equatable.dart';
import 'package:flutter_event_calendar/flutter_event_calendar.dart';

class CalendarEventModel extends Equatable {
  String calendarLanguage;
  CalendarType calendarType;
  CalendarOptions calendarOptions;
  HeaderOptions headerOptions;
  DayOptions dayOptions;
  List<CalendarDateTime> specialDays;
  CalendarEventModel(
      {required this.calendarLanguage,
      required this.calendarOptions,
      required this.calendarType,
      required this.dayOptions,
      required this.headerOptions,
      required this.specialDays});

  @override
  List<Object> get props => [specialDays];
}
