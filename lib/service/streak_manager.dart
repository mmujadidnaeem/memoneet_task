import 'package:shared_preferences/shared_preferences.dart';

class StreakManager {
  late SharedPreferences _prefs;
  late int _currentStreak;
  late DateTime _lastUpdateDate;

  static final StreakManager _instance = StreakManager._internal();

  factory StreakManager() {
    return _instance;
  }

  StreakManager._internal() {
    _currentStreak = 0;
    _lastUpdateDate = DateTime.now();
  }

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    _currentStreak = _prefs.getInt('streak') ?? 0;

    // Retrieve last update date
    final lastUpdateTimestamp = _prefs.getInt('last_update_timestamp') ?? 0;
    _lastUpdateDate = DateTime.fromMillisecondsSinceEpoch(lastUpdateTimestamp);

    // Check if last update was more than 24 hours ago
    if (!_isSameDay(_lastUpdateDate, DateTime.now())) {
      _lastUpdateDate = DateTime.now();
      _currentStreak++;
      await _prefs.setInt('streak', _currentStreak);
      await _prefs.setInt(
          'last_update_timestamp', _lastUpdateDate.millisecondsSinceEpoch);
    }
  }

  String get streak => _currentStreak.toString();

  Future<void> incrementStreak() async {
    if (!_isSameDay(_lastUpdateDate, DateTime.now())) {
      _lastUpdateDate = DateTime.now();
      _currentStreak++;
      await _prefs.setInt('streak', _currentStreak);
      await _prefs.setInt(
          'last_update_timestamp', _lastUpdateDate.millisecondsSinceEpoch);
    }
  }

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
}
