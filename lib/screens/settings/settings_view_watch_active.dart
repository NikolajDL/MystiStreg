import 'package:flutter/material.dart';
import 'package:mystistreg/main_page_controller.dart';
import 'package:mystistreg/screens/settings/settings_controller.dart';
import 'package:provider/provider.dart';

import '../counter_model.dart';

/// The View is purely declarative.
class SettingsViewWatchActive extends StatelessWidget {
  final SettingsController state;
  const SettingsViewWatchActive(this.state, {Key? key}) : super(key: key);

  Widget createButton(String label, String count, Function()? onDecrement,
      Function()? onIncrement) {
    return Row(
      children: [
        FloatingActionButton.small(
            backgroundColor: const Color(0xFF292929),
            onPressed: onDecrement,
            child: Icon(
              Icons.remove,
              color: Colors.white,
            )),
        Expanded(
            child: Center(
                child: Text(
          '$label ($count)',
          style: TextStyle(fontSize: 18),
        ))),
        FloatingActionButton.small(
            backgroundColor: const Color(0xFF292929),
            onPressed: onIncrement,
            child: Icon(
              Icons.add,
              color: Colors.white,
            )),
      ],
    );
  }

  Future<void> goBack() async {
    await MainPageController().controller.animateToPage(0,
        duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    double padding = (state.constraints.maxHeight / 4) - 20;

    return new Scaffold(
        body: Consumer<CounterModel>(builder: (context, model, child) {
      return ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(vertical: padding, horizontal: 8),
          children: <Widget>[
            TextButton(
                onPressed: this.goBack,
                child: Icon(
                  Icons.keyboard_arrow_up,
                  color: Colors.white,
                  size: 32,
                )),
            createButton('Øl', model.beerCount.toString(), model.decrementBeer,
                model.incrementBeer),
            createButton('Cider', model.ciderCount.toString(),
                model.decrementCider, model.incrementCider),
            createButton('Sodavand', model.sodaCount.toString(),
                model.decrementSoda, model.incrementSoda),
            createButton('Slik 5 kr.', model.chocoCount.toString(),
                model.decrementChoco, model.incrementChoco),
            createButton('Slik 2 kr.', model.candyCount.toString(),
                model.decrementCandy, model.incrementCandy),
            TextButton(
                onLongPress: state.confirmReset(model),
                onPressed: state.reset,
                child: Text(
                  state.resetText,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )),
          ]);
    }));
  }
}
