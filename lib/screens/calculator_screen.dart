import 'package:flutter/material.dart';
import '../models/load_record.dart';
import '../services/load_calculator_service.dart';
import '../services/storage_service.dart';
import '../l10n/app_localizations.dart';
import '../widgets/result_card.dart';
import 'history_screen.dart';

class CalculatorScreen extends StatefulWidget {
  final VoidCallback onToggleLanguage;

  const CalculatorScreen({
    super.key,
    required this.onToggleLanguage,
  });

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

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text(loc.appTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const HistoryScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: widget.onToggleLanguage,
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _applianceController,
              decoration: InputDecoration(labelText: loc.applianceName),
            ),
            TextField(
              controller: _voltageController,
              decoration: InputDecoration(labelText: loc.voltage),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _currentController,
              decoration: InputDecoration(labelText: loc.current),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _hoursController,
              decoration: InputDecoration(labelText: loc.hours),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _rateController,
              decoration: InputDecoration(labelText: loc.rate),
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 20),

            ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 130, 25, 7), // burgundy
    foregroundColor: Colors.white, // 👈 THIS changes text + icon color
  ),
  onPressed: () async {
    final result = LoadCalculatorService.calculate(
      applianceName: _applianceController.text,
      voltage: double.parse(_voltageController.text),
      current: double.parse(_currentController.text),
      hoursPerDay: double.parse(_hoursController.text),
      ratePerKwh: double.parse(_rateController.text),
    );

    await StorageService.saveRecord(result);

    setState(() {
      _record = result;
    });
  },
  child: Text(loc.calculate),
),

            if (_record != null) ResultCard(record: _record!),
          ],
        ),
      ),
    );
  }
}