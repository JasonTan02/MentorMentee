import 'package:hello_world/DateTime/date_time.dart';
import 'package:hive_flutter/hive_flutter.dart';

final _myBox = Hive.box("Habit_Database");

class habit_database {
  List todaysHabitList = [];
  Map<DateTime, int> heatMapDataSet = {};

  void create_default_data() {
    todaysHabitList = [
      ["Run", false],
      ["Read", false],
    ];
    _myBox.put("Start_date", todaysDateFormatted());
  }

  void loadData() {
    if (_myBox.get(todaysDateFormatted()) == null) {
      todaysHabitList = _myBox.get("Current_habit_list");
      for (int i = 0; i < todaysHabitList.length; i++) {
        todaysHabitList[i][1] = false;
      }
    } else {
      todaysHabitList = _myBox.get(todaysDateFormatted());
    }
  }

  void updateDatabase() {
    _myBox.put(todaysDateFormatted(), todaysHabitList);
    _myBox.put("Current_habit_list", todaysHabitList);
    calculateHabitPercentages();
    loadHeatMap();
  }

  void calculateHabitPercentages() {
    int countCompleted = 0;
    for (int i = 0; i < todaysHabitList.length; i++) {
      if (todaysHabitList[i][1] == true) {
        countCompleted++;
      }
    }
    String percent = todaysHabitList.isEmpty
        ? '0.0'
        : (countCompleted / todaysHabitList.length).toStringAsFixed(1);
    _myBox.put("Percentage_summary_${todaysDateFormatted()}", percent);
  }

  void loadHeatMap() {
    DateTime startDate = create_date_time_object(_myBox.get("Start_date"));
    int daysInBetween = DateTime.now().difference(startDate).inDays;

    for (int i = 0; i < daysInBetween + 1; i++) {
      String displayFormat = convert_date_into_string(
        startDate.add(Duration(days: i)),
      );
      double strengthAsPercent = double.parse(
        _myBox.get("Percentage_summary $displayFormat") ?? "0.0",
      );
      int year = startDate.add(Duration(days: i)).year;
      int month = startDate.add(Duration(days: i)).month;
      int day = startDate.add(Duration(days: i)).day;
      final percent_each_day = <DateTime, int>{
        DateTime(year, month, day): (10 * strengthAsPercent).toInt(),
      };
      heatMapDataSet.addEntries(percent_each_day.entries);
      print(heatMapDataSet);
    }
  }
}
