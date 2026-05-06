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
  
  //Object to JSON
  Map<String, dynamic> toJson() {
return {
'applianceName': applianceName,
'voltage': voltage,
'current': current,
'power': power,
'hoursPerDay': hoursPerDay,
'dailyEnergy': dailyEnergy,
'monthlyEnergy': monthlyEnergy,
'monthlyCost': monthlyCost,
'createdAt': createdAt.toIso8601String(),
};
}

//JSON to object
factory LoadRecord.fromJson(Map<String, dynamic> json) {
return LoadRecord(
applianceName: json['applianceName'],
voltage: json['voltage'],
current: json['current'],
power: json['power'],
hoursPerDay: json['hoursPerDay'],
dailyEnergy: json['dailyEnergy'],
monthlyEnergy: json['monthlyEnergy'],
monthlyCost: json['monthlyCost'],
createdAt: DateTime.parse(json['createdAt']),
);
}
}