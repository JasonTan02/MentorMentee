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
        textColor: Colors.white,
        showColorTip: false,
        showText: true,
        scrollable: true,
        size: 30,
        colorsets: const {
          1: Color.fromARGB(20, 2, 179, 8),
          2: Color.fromARGB(40, 179, 2, 70),
          3: Color.fromARGB(59, 179, 17, 2),
          4: Color.fromARGB(80, 179, 105, 2),
          5: Color.fromARGB(99, 2, 179, 117),
          6: Color.fromARGB(120, 135, 179, 2),
          7: Color.fromARGB(40, 2, 114, 179),
        },
        onClick: (value) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(value.toString())));
        },
      ),
    );
  }
}
