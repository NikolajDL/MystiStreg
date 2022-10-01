import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mystistreg/screens/marker_list/marker_list_controller.dart';

final Widget logo = SvgPicture.asset(
  'assets/images/logo.svg',
  color: Colors.black,
  semanticsLabel: 'A red up arrow',
  allowDrawingOutsideViewBox: true,
);

/// The View is purely declarative.
class MarkerListViewPhone extends StatelessWidget {
  final MarkerListController state;
  const MarkerListViewPhone(this.state, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: Center(child: logo));
  }
}
