// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Electrical Load Calculator';

  @override
  String get applianceName => 'Appliance Name';

  @override
  String get voltage => 'Voltage';

  @override
  String get current => 'Current';

  @override
  String get hours => 'Hours per Day';

  @override
  String get rate => 'Cost per kWh';

  @override
  String get calculate => 'Calculate';

  @override
  String get clear => 'Clear';

  @override
  String get history => 'History';

  @override
  String get noHistory => 'No history yet';

  @override
  String get fieldRequired => 'This field is required';

  @override
  String get invalidNumber => 'Enter a valid number';

  @override
  String get mustBePositive => 'Value must be greater than zero';

  @override
  String get savedToHistory => 'Saved to history';

  @override
  String get historyTitle => 'History';

  @override
  String get errorLoadingHistory => 'Error loading history';

  @override
  String get power => 'Power';

  @override
  String get cost => 'Cost';

  @override
  String get applianceHint => 'Example: Fan, Heater, Motor';

  @override
  String get voltageHint => 'Example: 230';

  @override
  String get currentHint => 'Example: 0.5';

  @override
  String get hoursHint => 'Example: 8';

  @override
  String get rateHint => 'Example: 0.12';

  @override
  String get dailyEnergy => 'Daily Energy';

  @override
  String get monthlyEnergy => 'Monthly Energy';
}
