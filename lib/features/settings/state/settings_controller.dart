import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsController extends ChangeNotifier {
  static const _keySound = 'settings_sound';
  static const _keyMusic = 'settings_music';
  static const _keyVibration = 'settings_vibration';

  bool soundEnabled = true;
  bool musicEnabled = true;
  bool vibrationEnabled = true;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    soundEnabled = prefs.getBool(_keySound) ?? true;
    musicEnabled = prefs.getBool(_keyMusic) ?? true;
    vibrationEnabled = prefs.getBool(_keyVibration) ?? true;
    notifyListeners();
  }

  Future<void> toggleSound(bool enabled) async {
    soundEnabled = enabled;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keySound, enabled);
  }

  Future<void> toggleMusic(bool enabled) async {
    musicEnabled = enabled;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyMusic, enabled);
  }

  Future<void> toggleVibration(bool enabled) async {
    vibrationEnabled = enabled;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyVibration, enabled);
  }

  Future<void> reset() async {
    soundEnabled = true;
    musicEnabled = true;
    vibrationEnabled = true;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keySound);
    await prefs.remove(_keyMusic);
    await prefs.remove(_keyVibration);
  }
}
