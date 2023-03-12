import 'package:flutter_event_calendar/flutter_event_calendar.dart';

class En {
  static Map fullMonthNames = const {
    'en': {
      CalendarType.GREGORIAN: [
        'January',
        'February',
        'March',
        'April',
        'May',
        'June',
        'July',
        'August',
        'September',
        'October',
        'November',
        'December'
      ]
    }
  };

  static Map shortMonthNames = const {
    'en': {
      CalendarType.GREGORIAN: [
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May',
        'Jun',
        'Jul',
        'Aug',
        'Sep',
        'Oct',
        'Nov',
        'Dec'
      ]
    }
  };
  static Map fullDayNames = const {
    'en': {
      CalendarType.GREGORIAN: [
        'Sunday',
        'Monday',
        'Tuesday',
        'Wednesday',
        'Thursday',
        'Friday',
        'Saturday',
        'Sunday'
      ]
    }
  };
  static Map titles = const {
    'en': {
      'empty': 'Empty',
      'month_selector': 'Choose a month',
      'year_selector': 'Choose a year',
      'day_selector': 'Choose a day'
    }
  };

  static Map directionIsRTL = {'en': false};
}
