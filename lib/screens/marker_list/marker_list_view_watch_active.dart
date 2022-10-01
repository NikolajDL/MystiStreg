import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexagon/hexagon.dart';
import 'package:mystistreg/screens/marker_list/marker_list_controller.dart';

class MarkerListViewWatchActive extends StatelessWidget {
  final MarkerListController state;

  MarkerListViewWatchActive(this.state, {Key? key}) : super(key: key);

  Widget createButton(String filePath, void Function()? onPressed,
          {double? width = 36, double? height = 36}) =>
      FloatingActionButton(
        backgroundColor: const Color(0xFF292929),
        onPressed: onPressed,
        child: SvgPicture.asset(
          filePath,
          color: Colors.white,
          width: width,
          height: height,
          allowDrawingOutsideViewBox: true,
        ),
      );

  final TextStyle counterTextStyle =
      TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF44336),
        body: Stack(children: <Widget>[
          Center(
            child: SvgPicture.asset(
              'assets/images/logo-name-no-rings.svg',
              color: Colors.black,
              semanticsLabel: 'The Mystifik logo',
              allowDrawingOutsideViewBox: true,
              width: MediaQuery.of(context).size.width / 1.8,
              height: MediaQuery.of(context).size.height / 1.8,
            ),
          ),
          Container(
            child: Center(
              child: InteractiveViewer(
                minScale: 0.2,
                maxScale: 4.0,
                child: HexagonGrid(
                  hexType: HexagonType.FLAT,
                  depth: 1,
                  buildTile: (coordinates) => HexagonWidgetBuilder(
                    padding: 0.0,
                    elevation: 0,
                    color: Colors.transparent,
                    cornerRadius: 8.0,
                  ),
                  buildChild: (coordinates) {
                    if (coordinates.q == -1 && coordinates.r == 0) {
                      return Stack(
                          clipBehavior: Clip.none,
                          alignment: AlignmentDirectional.center,
                          children: <Widget>[
                            createButton(
                                'assets/images/beer.svg', state.incrementBeer),
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                    '${state.beerCount > 0 ? state.beerCount : ''}',
                                    style: counterTextStyle))
                          ]);
                    }

                    if (coordinates.q == 0 && coordinates.r == -1) {
                      return Stack(
                          clipBehavior: Clip.none,
                          alignment: AlignmentDirectional.center,
                          children: <Widget>[
                            createButton('assets/images/cider.svg',
                                state.incrementCider),
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                    '${state.ciderCount > 0 ? state.ciderCount : ''}',
                                    style: counterTextStyle))
                          ]);
                    }

                    if (coordinates.q == 1 && coordinates.r == -1) {
                      return Stack(
                          clipBehavior: Clip.none,
                          alignment: AlignmentDirectional.center,
                          children: <Widget>[
                            createButton(
                                'assets/images/cola.svg', state.incrementSoda,
                                width: 42, height: 42),
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                    '${state.sodaCount > 0 ? state.sodaCount : ''}',
                                    style: counterTextStyle))
                          ]);
                    }

                    if (coordinates.q == -1 && coordinates.r == 1) {
                      return Stack(
                          clipBehavior: Clip.none,
                          alignment: AlignmentDirectional.center,
                          children: <Widget>[
                            createButton('assets/images/turtle.svg',
                                state.incrementChoco,
                                width: 44, height: 44),
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                    '${state.chocoCount > 0 ? state.chocoCount : ''}',
                                    style: counterTextStyle))
                          ]);
                    }

                    if (coordinates.q == 1 && coordinates.r == 0) {
                      return Stack(
                          clipBehavior: Clip.none,
                          alignment: AlignmentDirectional.center,
                          children: <Widget>[
                            createButton('assets/images/candy.svg',
                                state.incrementCandy),
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                    '${state.candyCount > 0 ? state.candyCount : ''}',
                                    style: counterTextStyle))
                          ]);
                    }

                    return SizedBox();
                  },
                ),
              ),
            ),
          )
        ]));
  }
}
