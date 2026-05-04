import 'package:flutter/material.dart';
import '../models/load_record.dart';
import '../services/load_calculator_service.dart';
import '../widgets/result_card.dart';
class CalculatorScreen extends StatefulWidget {
const CalculatorScreen({super.key});

@override
State<CalculatorScreen> createState() => _CalculatorScreenState();
}
class _CalculatorScreenState extends State<CalculatorScreen> {
final _formKey = GlobalKey<FormState>();
final _applianceController = TextEditingController();
final _voltageController = TextEditingController();
final _currentController = TextEditingController();
final _hoursController = TextEditingController();
final _rateController = TextEditingController();
LoadRecord? _record;
@override
void dispose() {
_applianceController.dispose();
_voltageController.dispose();
_currentController.dispose();
_hoursController.dispose();
_rateController.dispose();
super.dispose();
}
void _calculateLoad() {
if (!_formKey.currentState!.validate()) {
return;
}
final String applianceName = _applianceController.text.trim();
final double voltage = double.parse(_voltageController.text);
final double current = double.parse(_currentController.text);
final double hours = double.parse(_hoursController.text);
final double rate = double.parse(_rateController.text);
final LoadRecord result = LoadCalculatorService.calculate(
applianceName: applianceName,
voltage: voltage,
current: current,
hoursPerDay: hours,
ratePerKwh: rate,
);

setState(() {
_record = result;
});
}
void _clearForm() {
_applianceController.clear();
_voltageController.clear();
_currentController.clear();
_hoursController.clear();
_rateController.clear();
setState(() {
_record = null;
});
}
String? _validateText(String? value) {
if (value == null || value.trim().isEmpty) {
return 'This field is required';
}
return null;
}
String? _validateNumber(String? value) {
if (value == null || value.trim().isEmpty) {
return 'This field is required';
}
final number = double.tryParse(value);
if (number == null) {
return 'Enter a valid number';
}
if (number <= 0) {
return 'Value must be greater than zero';
}
return null;
}
Widget _buildNumberField({
required TextEditingController controller,

required String label,
required String hint,
required IconData icon,
}) {
return Padding(
padding: const EdgeInsets.only(bottom: 14),
child: TextFormField(
controller: controller,
validator: _validateNumber,
keyboardType: TextInputType.number,
decoration: InputDecoration(
labelText: label,
hintText: hint,
prefixIcon: Icon(icon),
border: const OutlineInputBorder(),
),
),
);
}
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text('Electrical Load Calculator'),
centerTitle: true,
),
body: SingleChildScrollView(
padding: const EdgeInsets.all(16),
child: Form(
key: _formKey,
child: Column(
children: [
TextFormField(
controller: _applianceController,
validator: _validateText,
decoration: const InputDecoration(
labelText: 'Appliance Name',
hintText: 'Example: Fan, Heater, Motor',
prefixIcon: Icon(Icons.electrical_services),
border: OutlineInputBorder(),
),
),


const SizedBox(height: 14),
_buildNumberField(
controller: _voltageController,
label: 'Voltage',
hint: 'Example: 230',
icon: Icons.bolt,
),
_buildNumberField(
controller: _currentController,
label: 'Current',
hint: 'Example: 0.5',
icon: Icons.power,
),
_buildNumberField(
controller: _hoursController,
label: 'Usage Hours per Day',
hint: 'Example: 8',
icon: Icons.timer,
),
_buildNumberField(
controller: _rateController,
label: 'Electricity Rate per kWh',
hint: 'Example: 0.12',
icon: Icons.attach_money,
),
Row(
children: [
Expanded(
child: ElevatedButton.icon(
onPressed: _calculateLoad,
icon: const Icon(Icons.calculate),
label: const Text('Calculate'),
),
),
const SizedBox(width: 12),
Expanded(
child: OutlinedButton.icon(
onPressed: _clearForm,
icon: const Icon(Icons.clear),

label: const Text('Clear'),
),
),
],
),
if (_record != null) ResultCard(record: _record!),
],
),
),
),
);
}
}