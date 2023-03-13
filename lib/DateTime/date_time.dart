String todaysDateFormatted() {
  var date_time_object = DateTime.now(); //today
  String year = date_time_object.year.toString();
  String month = date_time_object.month.toString();
  if (month.length == 1) {
    month = '0$month';
  }
  String day = date_time_object.day.toString();
  if (day.length == 1) {
    day = '0$day';
  }
  //format = yyyymmdd
  String displayFormat = year + month + day;

  return displayFormat;
}

DateTime create_date_time_object(String displayFormat) {
  int Y = int.parse(displayFormat.substring(0, 4)); //Y == Year
  int M = int.parse(displayFormat.substring(4, 6)); //M == Month
  int D = int.parse(displayFormat.substring(6, 8)); //D == Day
  DateTime date_time_object = DateTime(Y, M, D);
  return date_time_object;
}

String convert_date_into_string(DateTime dateTime) {
  String year = dateTime.year.toString();

  String month = dateTime.month.toString();
  if (month.length == 1) {
    month = '0$month';
  }
  String day = dateTime.day.toString();
  if (day.length == 1) {
    day = '0$day';
  }

  String displayFormat = year + month + day;

  return displayFormat;
}
