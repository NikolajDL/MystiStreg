import 'package:flutter/material.dart';
import 'package:mystistreg/screens/marker_list/marker_list_controller.dart';
import 'package:mystistreg/screens/marker_list/marker_list_view_watch_active.dart';
import 'package:wear/wear.dart';

/// The View is purely declarative.
class MarkerListViewWatch extends StatelessWidget {
  final MarkerListController state;
  const MarkerListViewWatch(this.state, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => WatchShape(
        builder: (BuildContext context, WearShape shape, Widget? child) =>
            MarkerListViewWatchActive(state),
      );
}
