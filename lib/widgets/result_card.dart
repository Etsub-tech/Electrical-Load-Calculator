import 'package:flutter/material.dart';
import '../models/load_record.dart';
class ResultCard extends StatelessWidget {
final LoadRecord record;
const ResultCard({
super.key,
required this.record,
});
@override
Widget build(BuildContext context) {
return Card(
margin: const EdgeInsets.only(top: 20),
elevation: 3,
child: Padding(
padding: const EdgeInsets.all(16),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
'Result for ${record.applianceName}',
style: Theme.of(context).textTheme.titleLarge,
),
const SizedBox(height: 12),
_resultRow('Voltage', '${record.voltage.toStringAsFixed(2)} V'),
_resultRow('Current', '${record.current.toStringAsFixed(2)} A'),
_resultRow('Power', '${record.power.toStringAsFixed(2)} W'),
_resultRow(
'Daily Energy',
'${record.dailyEnergy.toStringAsFixed(3)} kWh',
),
_resultRow(
'Monthly Energy',
'${record.monthlyEnergy.toStringAsFixed(3)} kWh',
),
_resultRow(
'Estimated Monthly Cost',
'${record.monthlyCost.toStringAsFixed(2)}',


),
],
),
),
);
}
Widget _resultRow(String label, String value) {
return Padding(
padding: const EdgeInsets.symmetric(vertical: 5),
child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Text(label),
Text(
value,
style: const TextStyle(fontWeight: FontWeight.bold),
),
],
),
);
}
}