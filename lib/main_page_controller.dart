import 'package:flutter/material.dart';

class MainPageController {
  final _controller = PageController();
  static final MainPageController _instance = MainPageController._internal();

  factory MainPageController() {
    return _instance;
  }

  MainPageController._internal();

  PageController get controller => _controller;
}
