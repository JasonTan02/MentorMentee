import 'package:flutter_event_calendar/flutter_event_calendar.dart';

abstract class CalendarProvider {
  bool isRTL();
  Map getMonthDays(WeekDayStringTypes type, int index);
  Map getMonthDaysShort(int index);
  CalendarDateTime getNextMonthDateTime();
  CalendarDateTime getPreviousMonthDateTime();
  CalendarDateTime getNextDayDateTime();
  CalendarDateTime getPreviousDateTime();
  CalendarDateTime getDateTime();

  String getFormatDate({DateTime? customDate});
  CalendarDateTime goToMonth(index);
  CalendarDateTime goToDay(index);
  CalendarDateTime goToYear(index);
  int getDateTimePart(PartFormat format);
  List<int> getYears();
  List<int> getDayAmount();
  CalendarType getCalendarType();
}
