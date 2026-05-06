import 'package:flutter/material.dart';
import '../models/load_record.dart';
import '../services/storage_service.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
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
            return const Center(child: Text('No history yet'));
          }

          return ListView.builder(
            itemCount: records.length,
            itemBuilder: (context, index) {
              final r = records[index];

              return Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  title: Text(r.applianceName),
                  subtitle: Text(
                      'Power: ${r.power.toStringAsFixed(2)} W\n'
                      'Cost: ${r.monthlyCost.toStringAsFixed(2)}'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}