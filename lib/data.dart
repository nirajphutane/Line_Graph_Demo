import 'dart:math';

class Data {

  static Map<DateTime, double> create(int noOfDataSets) {
    Map<DateTime, double> data = Map();
    for (int minute = 0; minute < noOfDataSets; minute++) {
      data[DateTime.now().add(Duration(minutes: minute))] = Random.secure().nextDouble();
    }
    return data;
  }
}