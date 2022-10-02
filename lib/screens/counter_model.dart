import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterModel extends ChangeNotifier {
  SharedPreferences? _pref;

  int _beerCount = 0;
  int _ciderCount = 0;
  int _sodaCount = 0;
  int _chocoCount = 0;
  int _candyCount = 0;

  int get beerCount => _beerCount;
  int get ciderCount => _ciderCount;
  int get sodaCount => _sodaCount;
  int get chocoCount => _chocoCount;
  int get candyCount => _candyCount;

  CounterModel() {
    _loadFromPrefs();
  }

  void incrementBeer() {
    _beerCount++;
    _saveToPrefs();
    notifyListeners();
  }

  void incrementCider() {
    _ciderCount++;
    _saveToPrefs();
    notifyListeners();
  }

  void incrementSoda() {
    _sodaCount++;
    _saveToPrefs();
    notifyListeners();
  }

  void incrementChoco() {
    _chocoCount++;
    _saveToPrefs();
    notifyListeners();
  }

  void incrementCandy() {
    _candyCount++;
    _saveToPrefs();
    notifyListeners();
  }

  void decrementBeer() {
    _beerCount = max(0, _beerCount - 1);
    _saveToPrefs();
    notifyListeners();
  }

  void decrementCider() {
    _ciderCount = max(0, _ciderCount - 1);
    _saveToPrefs();
    notifyListeners();
  }

  void decrementSoda() {
    _sodaCount = max(0, _sodaCount - 1);
    _saveToPrefs();
    notifyListeners();
  }

  void decrementChoco() {
    _chocoCount = max(0, _chocoCount - 1);
    _saveToPrefs();
    notifyListeners();
  }

  void decrementCandy() {
    _candyCount = max(0, _candyCount - 1);
    _saveToPrefs();
    notifyListeners();
  }

  void reset() {
    _beerCount = 0;
    _ciderCount = 0;
    _sodaCount = 0;
    _chocoCount = 0;
    _candyCount = 0;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    if (_pref == null) _pref = await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _beerCount = _pref?.getInt('beerCount') ?? 0;
    _ciderCount = _pref?.getInt('ciderCount') ?? 0;
    _sodaCount = _pref?.getInt('sodaCount') ?? 0;
    _chocoCount = _pref?.getInt('chocoCount') ?? 0;
    _candyCount = _pref?.getInt('candyCount') ?? 0;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _pref?.setInt('beerCount', _beerCount);
    _pref?.setInt('ciderCount', _ciderCount);
    _pref?.setInt('sodaCount', _sodaCount);
    _pref?.setInt('chocoCount', _chocoCount);
    _pref?.setInt('candyCount', _candyCount);
  }
}
