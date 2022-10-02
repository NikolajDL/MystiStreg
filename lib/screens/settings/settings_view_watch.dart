import 'package:flutter/material.dart';
import 'package:mystistreg/screens/settings/settings_controller.dart';
import 'package:mystistreg/screens/settings/settings_view_watch_active.dart';
import 'package:wear/wear.dart';

/// The View is purely declarative.
class SettingsViewWatch extends StatelessWidget {
  final SettingsController state;
  const SettingsViewWatch(this.state, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => WatchShape(
      builder: (BuildContext context, WearShape shape, Widget? child) =>
          SettingsViewWatchActive(state));
}
