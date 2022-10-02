import 'package:flutter/material.dart';
import 'package:mystistreg/screens/marker_list/marker_list_route.dart';
import 'package:mystistreg/screens/marker_list/marker_list_view_phone.dart';
import 'package:mystistreg/screens/marker_list/marker_list_view_watch.dart';

/// The Controller handles the state and business logic.
class MarkerListController extends State<MarkerListRoute> {
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
}
