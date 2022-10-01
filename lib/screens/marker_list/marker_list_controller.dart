import 'package:flutter/material.dart';
import 'package:mystistreg/screens/counter_model.dart';
import 'package:mystistreg/screens/marker_list/marker_list_route.dart';
import 'package:mystistreg/screens/marker_list/marker_list_view_phone.dart';
import 'package:mystistreg/screens/marker_list/marker_list_view_watch.dart';

/// The Controller handles the state and business logic.
class MarkerListController extends State<MarkerListRoute> {
  // int get beerCount => CounterModel.of(context)._beerCount;
  // int get ciderCount => CounterModel.of(context)._ciderCount;
  // int get sodaCount => CounterModel.of(context)._sodaCount;
  // int get chocoCount => CounterModel.of(context)._chocoCount;
  // int get candyCount => CounterModel.of(context)._candyCount;

  @override
  void initState() {
    super.initState();
    // data.loadCounts();
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

  // Future<void> _loadCounts() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     _beerCount = (prefs.getInt('beerCount') ?? 0);
  //     _ciderCount = (prefs.getInt('ciderCount') ?? 0);
  //     _sodaCount = (prefs.getInt('sodaCount') ?? 0);
  //     _chocoCount = (prefs.getInt('chocoCount') ?? 0);
  //     _candyCount = (prefs.getInt('candyCount') ?? 0);
  //   });
  // }

  // Future<void> incrementBeer() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     _beerCount = (prefs.getInt('beerCount') ?? 0) + 1;
  //     prefs.setInt('beerCount', _beerCount);
  //   });
  // }

  // Future<void> incrementCider() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     _ciderCount = (prefs.getInt('ciderCount') ?? 0) + 1;
  //     prefs.setInt('ciderCount', _ciderCount);
  //   });
  // }

  // Future<void> incrementSoda() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     _sodaCount = (prefs.getInt('sodaCount') ?? 0) + 1;
  //     prefs.setInt('sodaCount', _sodaCount);
  //   });
  // }

  // Future<void> incrementChoco() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     _chocoCount = (prefs.getInt('chocoCount') ?? 0) + 1;
  //     prefs.setInt('chocoCount', _chocoCount);
  //   });
  // }

  // Future<void> incrementCandy() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     _candyCount = (prefs.getInt('candyCount') ?? 0) + 1;
  //     prefs.setInt('candyCount', _candyCount);
  //   });
  // }
}
