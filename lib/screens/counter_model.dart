// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

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

// class CounterModel {
//   const CounterModel(
//       {this.beerCount = 0,
//       this.ciderCount = 0,
//       this.sodaCount = 0,
//       this.chocoCount = 0,
//       this.candyCount = 0});

//   final int beerCount;
//   final int ciderCount;
//   final int sodaCount;
//   final int chocoCount;
//   final int candyCount;

//   Future<void> initialize() async {
//     final prefs = await SharedPreferences.getInstance();
//     this.beerCount = (prefs.getInt('beerCount') ?? 0);
//     this.ciderCount = (prefs.getInt('ciderCount') ?? 0);
//     this.sodaCount = (prefs.getInt('sodaCount') ?? 0);
//     this.chocoCount = (prefs.getInt('chocoCount') ?? 0);
//     this.candyCount = (prefs.getInt('candyCount') ?? 0);
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) {
//       return true;
//     }
//     if (other.runtimeType != runtimeType) {
//       return false;
//     }
//     return other is CounterModel &&
//         other.beerCount == beerCount &&
//         other.ciderCount == ciderCount &&
//         other.sodaCount == sodaCount &&
//         other.chocoCount == chocoCount &&
//         other.candyCount == candyCount;
//   }

//   @override
//   int get hashCode =>
//       Object.hash(beerCount, ciderCount, sodaCount, chocoCount, candyCount);

//   static CounterModel of(BuildContext context) {
//     final binding =
//         context.dependOnInheritedWidgetOfExactType<_CounterModelBindingScope>();
//     return binding!.modelBindingState.currentModel;
//   }
// }

// class _CounterModelBindingScope extends InheritedWidget {
//   _CounterModelBindingScope({
//     Key? key,
//     required this.modelBindingState,
//     required Widget child,
//   }) : super(key: key, child: child);

//   final _CounterModelBindingState modelBindingState;

//   @override
//   bool updateShouldNotify(_CounterModelBindingScope oldWidget) => true;
// }

// class _CounterModelBindingState extends State<CounterModelBinding> {
//   CounterModel currentModel = CounterModel();

//   @override
//   void initState() {
//     super.initState();
//     currentModel = widget.initialModel;
//   }

//   void updateModel(CounterModel newModel) {
//     if (newModel != currentModel) {
//       setState(() {
//         currentModel = newModel;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _CounterModelBindingScope(
//       modelBindingState: this,
//       child: widget.child,
//     );
//   }
// }

// class CounterModelBinding extends StatefulWidget {
//   CounterModelBinding({
//     Key? key,
//     this.initialModel = const CounterModel(),
//     required this.child,
//   }) : super(key: key);

//   final CounterModel initialModel;
//   final Widget child;

//   _CounterModelBindingState createState() => _CounterModelBindingState();
// }



//   // Future<void> loadCounts() async {
//   //   final prefs = await SharedPreferences.getInstance();
//   //   _beerCount = (prefs.getInt('beerCount') ?? 0);
//   //   _ciderCount = (prefs.getInt('ciderCount') ?? 0);
//   //   _sodaCount = (prefs.getInt('sodaCount') ?? 0);
//   //   _chocoCount = (prefs.getInt('chocoCount') ?? 0);
//   //   _candyCount = (prefs.getInt('candyCount') ?? 0);
//   // }

//   // Future<void> incrementBeer() async {
//   //   final prefs = await SharedPreferences.getInstance();
//   //   _beerCount = (prefs.getInt('beerCount') ?? 0) + 1;
//   //   prefs.setInt('beerCount', _beerCount);
//   // }

//   // Future<void> incrementCider() async {
//   //   final prefs = await SharedPreferences.getInstance();
//   //   _ciderCount = (prefs.getInt('ciderCount') ?? 0) + 1;
//   //   prefs.setInt('ciderCount', _ciderCount);
//   // }

//   // Future<void> incrementSoda() async {
//   //   final prefs = await SharedPreferences.getInstance();
//   //   _sodaCount = (prefs.getInt('sodaCount') ?? 0) + 1;
//   //   prefs.setInt('sodaCount', _sodaCount);
//   // }

//   // Future<void> incrementChoco() async {
//   //   final prefs = await SharedPreferences.getInstance();
//   //   _chocoCount = (prefs.getInt('chocoCount') ?? 0) + 1;
//   //   prefs.setInt('chocoCount', _chocoCount);
//   // }

//   // Future<void> incrementCandy() async {
//   //   final prefs = await SharedPreferences.getInstance();
//   //   _candyCount = (prefs.getInt('candyCount') ?? 0) + 1;
//   //   prefs.setInt('candyCount', _candyCount);
//   // }