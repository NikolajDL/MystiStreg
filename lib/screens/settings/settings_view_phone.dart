import 'package:flutter/material.dart';
import 'package:mystistreg/screens/settings/settings_controller.dart';

/// The View is purely declarative.
class SettingsViewPhone extends StatelessWidget {
  final SettingsController state;
  const SettingsViewPhone(this.state, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: Center(child: Text('Settings')));
  }
}
