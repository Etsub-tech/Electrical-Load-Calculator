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
  String get noHistory => 'No saved calculations yet';

  @override
  String get fieldRequired => 'This field is required';

  @override
  String get invalidNumber => 'Enter a valid number';

  @override
  String get mustBePositive => 'Value must be greater than zero';

  @override
  String get savedToHistory => 'Saved to history';
}
