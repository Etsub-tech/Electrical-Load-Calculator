import 'package:flutter/material.dart';
import '../models/load_record.dart';
import '../l10n/app_localizations.dart';

class ResultCard extends StatelessWidget {
  final LoadRecord record;

  const ResultCard({
    super.key,
    required this.record,
  });

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF800020), // burgundy accent
          width: 1.5,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Appliance name header
          Text(
            record.applianceName,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          _row(loc.power, '${record.power.toStringAsFixed(2)} W'),
          _row(loc.dailyEnergy, '${record.dailyEnergy.toStringAsFixed(3)} kWh'),
          _row(loc.monthlyEnergy, '${record.monthlyEnergy.toStringAsFixed(3)} kWh'),
          _row(loc.cost, '${record.monthlyCost.toStringAsFixed(2)}'),

        ],
      ),
    );
  }

  Widget _row(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 14,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}