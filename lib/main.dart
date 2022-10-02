import 'package:flutter/material.dart';
import 'package:mystistreg/main_page_controller.dart';
import 'package:mystistreg/screens/counter_model.dart';
import 'package:mystistreg/screens/marker_list/marker_list_route.dart';
import 'package:mystistreg/screens/settings/settings_route.dart';
import 'package:provider/provider.dart';

import 'theme/theme.dart';

void main() {
  runApp(Provider(create: (_) => CounterModel(), child: const App()));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Mysti Streg',
        theme: buildLightTheme(),
        darkTheme: buildDarkTheme(),
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        home: PageView(
          scrollDirection: Axis.vertical,
          controller: MainPageController().controller,
          children: [new MarkerListRoute(), new SettingsRoute()],
        ));
  }
}
