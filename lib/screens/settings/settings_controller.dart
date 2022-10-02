import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mystistreg/screens/counter_model.dart';
import 'package:mystistreg/screens/settings/settings_route.dart';
import 'package:mystistreg/screens/settings/settings_view_phone.dart';
import 'package:mystistreg/screens/settings/settings_view_watch.dart';

/// The Controller handles the state and business logic.
class SettingsController extends State<SettingsRoute> {
  Timer? countdownTimer;
  Duration countdownDuration = Duration(seconds: 10);

  bool _isResetting = false;
  BoxConstraints constraints = BoxConstraints();

  String get resetText => _isResetting
      ? 'Hold to confirm (${countdownDuration.inSeconds}s)'
      : 'Reset';

  reset() {
    setState(() {
      this._isResetting = true;
      debugPrint(this._isResetting.toString());
    });
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  confirmReset(CounterModel model) {
    return () {
      if (!_isResetting) {
        this.reset();
      } else {
        model.reset();
        setState(() {
          this._isResetting = false;
          countdownTimer!.cancel();
          countdownDuration = Duration(seconds: 10);
        });
      }
    };
  }

  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = countdownDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
        countdownDuration = Duration(seconds: 10);
        _isResetting = false;
      } else {
        countdownDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      this.constraints = constraints;

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
