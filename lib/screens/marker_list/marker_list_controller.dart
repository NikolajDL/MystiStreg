import 'package:flutter/material.dart';
import 'package:mystistreg/screens/marker_list/marker_list_route.dart';
import 'package:mystistreg/screens/marker_list/marker_list_view_phone.dart';
import 'package:mystistreg/screens/marker_list/marker_list_view_watch.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// The Controller handles the state and business logic.
class MarkerListController extends State<MarkerListRoute> {
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

  @override
  void initState() {
    super.initState();
    _loadCounts();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      debugPrint('Host device screen width: ${constraints.maxWidth}');

      // Watch-sized device
      if (constraints.maxWidth < 300) {
        return MarkerListViewWatch(this);
      }
      // Phone-sized device
      else {
        return MarkerListViewPhone(this);
      }
    });
  }

  Future<void> _loadCounts() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _beerCount = (prefs.getInt('beerCount') ?? 0);
      _ciderCount = (prefs.getInt('ciderCount') ?? 0);
      _sodaCount = (prefs.getInt('sodaCount') ?? 0);
      _chocoCount = (prefs.getInt('chocoCount') ?? 0);
      _candyCount = (prefs.getInt('candyCount') ?? 0);
    });
  }

  Future<void> incrementBeer() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _beerCount = (prefs.getInt('beerCount') ?? 0) + 1;
      prefs.setInt('beerCount', _beerCount);
    });
  }

  Future<void> incrementCider() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _ciderCount = (prefs.getInt('ciderCount') ?? 0) + 1;
      prefs.setInt('ciderCount', _ciderCount);
    });
  }

  Future<void> incrementSoda() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _sodaCount = (prefs.getInt('sodaCount') ?? 0) + 1;
      prefs.setInt('sodaCount', _sodaCount);
    });
  }

  Future<void> incrementChoco() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _chocoCount = (prefs.getInt('chocoCount') ?? 0) + 1;
      prefs.setInt('chocoCount', _chocoCount);
    });
  }

  Future<void> incrementCandy() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _candyCount = (prefs.getInt('candyCount') ?? 0) + 1;
      prefs.setInt('candyCount', _candyCount);
    });
  }
}
