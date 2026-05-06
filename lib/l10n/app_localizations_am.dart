// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Amharic (`am`).
class AppLocalizationsAm extends AppLocalizations {
  AppLocalizationsAm([String locale = 'am']) : super(locale);

  @override
  String get appTitle => 'የኤሌክትሪክ ጭነት መቁጠሪያ';

  @override
  String get applianceName => 'የመሳሪያ ስም';

  @override
  String get voltage => 'ቮልቴጅ';

  @override
  String get current => 'ካረንት';

  @override
  String get hours => 'የቀን ሰዓት';

  @override
  String get rate => 'ዋጋ በ kWh';

  @override
  String get calculate => 'አስላ';

  @override
  String get clear => 'አጥፋ';

  @override
  String get history => 'ታሪክ';

  @override
  String get noHistory => 'ምንም ውሂብ የለም';

  @override
  String get fieldRequired => 'ይህ መስክ አስፈላጊ ነው';

  @override
  String get invalidNumber => 'ትክክለኛ ቁጥር ያስገቡ';

  @override
  String get mustBePositive => 'ከዜሮ በላይ መሆን አለበት';

  @override
  String get savedToHistory => 'ወደ ታሪክ ተቀምጧል';
}
