import 'package:flutter/material.dart';
import '../models/load_record.dart';
import '../services/storage_service.dart';
import '../l10n/app_localizations.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  late Future<List<LoadRecord>> _historyFuture;

  @override
  void initState() {
    super.initState();
    _historyFuture = StorageService.getRecords();
  }

  Future<void> _clearHistory() async {
    await StorageService.clearHistory();
    setState(() {
      _historyFuture = StorageService.getRecords();
    });
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text(loc.historyTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: _clearHistory,
          ),
        ],
      ),

      body: FutureBuilder<List<LoadRecord>>(
        future: _historyFuture,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final records = snapshot.data!;

          if (records.isEmpty) {
            return Center(child: Text(loc.noHistory));
          }

          return ListView.builder(
            itemCount: records.length,
            itemBuilder: (context, index) {
              final r = records[index];

              return Card(
                color: Colors.white,
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  title: Text(r.applianceName),
                  subtitle: Text(
                    '${loc.power}: ${r.power.toStringAsFixed(2)} W\n'
                    '${loc.cost}: ${r.monthlyCost.toStringAsFixed(2)}',
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}