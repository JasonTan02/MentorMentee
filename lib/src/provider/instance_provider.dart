import 'package:flutter_event_calendar/flutter_event_calendar.dart';
import 'calendars/calendar_provider.dart';
import 'calendars/gregorian_calendar.dart';

CalendarProvider createInstance(CalendarType cType) {
  final Map<CalendarType, CalendarProvider> _factories = {
    CalendarType.GREGORIAN: GregorianCalendar()
  };
  if (!_factories.keys.contains(cType)) {
    throw Exception(
        "Cannot create instance of calendar, check available calendar types or create your own calendar that implements BaseCalendarProvider");
  }
  return _factories[cType]!;
}
