import 'package:flutter/material.dart';
import 'package:mystistreg/screens/marker_list/marker_list_controller.dart';

/// The Model Widget defines external parameters.
class MarkerListRoute extends StatefulWidget {
  const MarkerListRoute({Key? key}) : super(key: key);

  @override
  State<MarkerListRoute> createState() => MarkerListController();
}
