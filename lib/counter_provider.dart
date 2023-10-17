import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterProvider extends ChangeNotifier {
  int _counter = 0;

  CounterProvider() {
    loadPreferences();
  }
  int get counter => _counter;

  void setPlusOne() async {
    _counter++;
    notifyListeners();
    savePreferences();
  }

  void setMinusOne() {
    _counter--;
    notifyListeners();
    savePreferences();
  }

  void resetCounter() {
    _counter = 0;
    notifyListeners();
    savePreferences();
  }

  void loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counter = prefs.getInt('counter') ?? 0;
    notifyListeners();
  }

  void savePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('counter', _counter);
  }
}
