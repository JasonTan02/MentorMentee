import 'package:flutter/material.dart';
import 'package:flutter_event_calendar/flutter_event_calendar.dart';
import 'package:scoped_model/scoped_model.dart';

class HeaderOptions extends Model {
  WeekDayStringTypes weekDayStringTypes;
  MonthStringTypes monthStringTypes;
  Color headerTextColor;
  Color navigationColor;
  Color resetDateColor;
  Color calendarIconColor;

  HeaderOptions(
      {this.weekDayStringTypes = WeekDayStringTypes.FULL,
      this.monthStringTypes = MonthStringTypes.SHORT,
      this.headerTextColor = Colors.black,
      this.resetDateColor = Colors.black,
      this.calendarIconColor = Colors.black,
      this.navigationColor = Colors.black});
  static HeaderOptions of(BuildContext context) =>
      ScopedModel.of<HeaderOptions>(context);
}
