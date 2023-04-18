class ConsumptionHourly {
  int hour;
  double consumption;

  ConsumptionHourly({
    required this.hour,
    required this.consumption,
  });
  factory ConsumptionHourly.fromMap(Map<String, dynamic> map) {
    return ConsumptionHourly(
      hour: map['hour'],
      consumption: map['consumption'],
    );
  }
}
