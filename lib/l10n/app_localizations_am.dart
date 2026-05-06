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
  String get noHistory => 'ምንም ታሪክ የለም';

  @override
  String get fieldRequired => 'ይህ መስክ አስፈላጊ ነው';

  @override
  String get invalidNumber => 'ትክክለኛ ቁጥር ያስገቡ';

  @override
  String get mustBePositive => 'ከዜሮ በላይ መሆን አለበት';

  @override
  String get savedToHistory => 'ወደ ታሪክ ተቀምጧል';

  @override
  String get historyTitle => 'ታሪክ';

  @override
  String get errorLoadingHistory => 'ታሪክ ሲጫን ስህተት ተፈጥሯል';

  @override
  String get power => 'ኃይል';

  @override
  String get cost => 'ዋጋ';

  @override
  String get applianceHint => 'ምሳሌ: ፋን, ማሞቂያ, ሞተር';

  @override
  String get voltageHint => 'ምሳሌ: 230';

  @override
  String get currentHint => 'ምሳሌ: 0.5';

  @override
  String get hoursHint => 'ምሳሌ: 8';

  @override
  String get rateHint => 'ምሳሌ: 0.12';

  @override
  String get dailyEnergy => 'ዕለታዊ ኃይል';

  @override
  String get monthlyEnergy => 'ወርሃዊ ኃይል';
}
