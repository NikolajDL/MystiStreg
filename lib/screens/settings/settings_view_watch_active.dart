import 'package:flutter/material.dart';
import 'package:mystistreg/screens/settings/settings_controller.dart';

/// The View is purely declarative.
class SettingsViewWatchActive extends StatelessWidget {
  final SettingsController state;
  const SettingsViewWatchActive(this.state, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: Center(child: Text('Settings')));
  }
}
