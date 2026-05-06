import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../models/load_record.dart';
import '../services/load_calculator_service.dart';
import '../services/storage_service.dart';
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

  Future<void> _calculateLoad() async {
    if (!_formKey.currentState!.validate()) return;

    final result = LoadCalculatorService.calculate(
      applianceName: _applianceController.text.trim(),
      voltage: double.parse(_voltageController.text),
      current: double.parse(_currentController.text),
      hoursPerDay: double.parse(_hoursController.text),
      ratePerKwh: double.parse(_rateController.text),
    );

    await StorageService.saveRecord(result);

    setState(() {
      _record = result;
    });

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!.savedToHistory),
      ),
    );
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
    final loc = AppLocalizations.of(context)!;

    if (value == null || value.trim().isEmpty) {
      return loc.fieldRequired;
    }
    return null;
  }

  String? _validateNumber(String? value) {
    final loc = AppLocalizations.of(context)!;

    if (value == null || value.trim().isEmpty) {
      return loc.fieldRequired;
    }

    final number = double.tryParse(value);

    if (number == null) {
      return loc.invalidNumber;
    }

    if (number <= 0) {
      return loc.mustBePositive;
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
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.appTitle),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const HistoryScreen(),
                ),
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
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Appliance name
              TextFormField(
                controller: _applianceController,
                validator: _validateText,
                decoration: InputDecoration(
                  labelText: loc.applianceName,
                  hintText: 'Example: Fan, Heater, Motor',
                  prefixIcon: const Icon(Icons.electrical_services),
                  border: const OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 14),

              // Voltage
              _buildNumberField(
                controller: _voltageController,
                label: loc.voltage,
                hint: 'Example: 230',
                icon: Icons.bolt,
              ),

              // Current
              _buildNumberField(
                controller: _currentController,
                label: loc.current,
                hint: 'Example: 0.5',
                icon: Icons.power,
              ),

              // Hours
              _buildNumberField(
                controller: _hoursController,
                label: loc.hours,
                hint: 'Example: 8',
                icon: Icons.timer,
              ),

              // Rate
              _buildNumberField(
                controller: _rateController,
                label: loc.rate,
                hint: 'Example: 0.12',
                icon: Icons.attach_money,
              ),

              const SizedBox(height: 10),

              // Buttons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _calculateLoad,
                      icon: const Icon(Icons.calculate),
                      label: Text(loc.calculate),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: _clearForm,
                      icon: const Icon(Icons.clear),
                      label: Text(loc.clear),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Result
              if (_record != null) ResultCard(record: _record!),
            ],
          ),
        ),
      ),
    );
  }
}