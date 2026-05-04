class LoadRecord {
  final String applianceName;
  final double voltage;
  final double current;
  final double power;
  final double hoursPerDay;
  final double dailyEnergy;
  final double monthlyEnergy;
  final double monthlyCost;
  final DateTime createdAt;

  LoadRecord({
    required this.applianceName,
    required this.voltage,
    required this.current,
    required this.power,
    required this.hoursPerDay,
    required this.dailyEnergy,
    required this.monthlyEnergy,
    required this.monthlyCost,
    required this.createdAt,
  });
}