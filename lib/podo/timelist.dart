class MedData {
  List<TimeList> timList;
  Map toJson() => {
    'timList': timList.map((e) => e.toJson()).toList(),
  };
}


class TimeList {
  String day;
  List<Occurance> occurance;

  Map toJson() => {
        'day': day,
        'occurance': occurance.map((e) => e.toJson()).toList(),
      };
}

class Occurance {
  String type;
  String time;
  String time_type;

  Map toJson() => {'type': type, 'time': time, 'time_type': time_type};
}
