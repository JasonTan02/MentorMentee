import 'package:flutter/material.dart';
import 'package:hello_world/DateTime/date_time.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class MonthSummary extends StatelessWidget {
  final Map<DateTime, int>? datasets;
  final String startDate;
  const MonthSummary({
    super.key,
    required this.datasets,
    required this.startDate,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 25, bottom: 25),
      child: HeatMap(
        startDate: create_date_time_object(startDate),
        endDate: DateTime.now().add(Duration(days: 0)),
        datasets: datasets,
        colorMode: ColorMode.color,
        defaultColor: Colors.grey[200],
        textColor: Colors.black,
        showColorTip: false,
        showText: true,
        scrollable: true,
        size: 30,
        colorsets: const {
          1: Color.fromARGB(20, 2, 179, 8),
          2: Color.fromARGB(186, 218, 96, 143),
          3: Color.fromARGB(225, 245, 119, 107),
          4: Color.fromARGB(215, 230, 175, 98),
          5: Color.fromARGB(198, 2, 179, 117),
          6: Color.fromARGB(222, 135, 179, 2),
          7: Color.fromARGB(194, 4, 142, 222),
        },
        onClick: (value) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(value.toString())));
        },
      ),
    );
  }
}
