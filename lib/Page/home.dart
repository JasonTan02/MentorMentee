import 'package:flutter/material.dart';
import 'package:hello_world/Comp/alert_box.dart';
import 'package:hello_world/Comp/habit_tile.dart';
import 'package:hello_world/Data/habit_database.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hello_world/Comp/fab.dart';
import 'package:hello_world/Comp/sum_of_month.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  habit_database db = habit_database();
  final _myBox = Hive.box("Habit_Database");

  @override
  void initState() {
    if (_myBox.get("Current_Habit_List") == null) {
      db.create_default_data();
    } else {
      db.loadData();
    }
    db.updateDatabase();
    super.initState();
  }

  void checkBoxTapped(bool? value, int index) {
    setState(() {
      db.todaysHabitList[index][1] = value;
    });
    db.updateDatabase();
  }

  final _newHabitNameController = TextEditingController();
  void createNewHabit() {
    showDialog(
        context: context,
        builder: (context) {
          return my_alert_box(
            controller: _newHabitNameController,
            hintText: 'Enter habit name',
            onCancel: cancelDialogBox,
            onSave: saveNewHabit,
          );
        });
  }

  void cancelDialogBox() {
    _newHabitNameController.clear();
    Navigator.of(context).pop();
  }

  void saveNewHabit() {
    setState(() {
      db.todaysHabitList.add([_newHabitNameController.text, false]);
    });
    _newHabitNameController.clear();
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  void open_habit_setting(int index) {
    showDialog(
        context: context,
        builder: (context) {
          return my_alert_box(
              controller: _newHabitNameController,
              hintText: db.todaysHabitList[index][0],
              onCancel: cancelDialogBox,
              onSave: () => save_existing_habit(index));
        });
  }

  void save_existing_habit(int index) {
    setState(() {
      db.todaysHabitList[index][0] = _newHabitNameController.text;
    });
    _newHabitNameController.clear();
    Navigator.pop(context);
    db.updateDatabase();
  }

  void delete_habit(int index) {
    setState(() {
      db.todaysHabitList.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton:
          my_floating_action_button(onPressed: createNewHabit),
      body: ListView(
        children: [
          MonthSummary(
            datasets: db.heatMapDataSet,
            startDate: _myBox.get("Start_Date"),
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return HabitTile(
                  habitName: db.todaysHabitList[index][0],
                  completeHabit: db.todaysHabitList[index][1],
                  onChanged: (value) => checkBoxTapped(value, index),
                  settingsTapped: (context) => open_habit_setting(index),
                  deleteTapped: (context) => delete_habit(index),
                );
              })
        ],
      ),
    );
  }
}
