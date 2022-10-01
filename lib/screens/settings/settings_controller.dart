import 'package:flutter/material.dart';
import 'package:mystistreg/screens/settings/settings_route.dart';
import 'package:mystistreg/screens/settings/settings_view_phone.dart';
import 'package:mystistreg/screens/settings/settings_view_watch.dart';

/// The Controller handles the state and business logic.
class SettingsController extends State<SettingsRoute> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      debugPrint('Host device screen width: ${constraints.maxWidth}');

      // Watch-sized device
      if (constraints.maxWidth < 300) {
        return SettingsViewWatch(this);
      }
      // Phone-sized device
      else {
        return SettingsViewPhone(this);
      }
    });
  }
}
