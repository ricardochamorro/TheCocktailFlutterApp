import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:view/view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Core.init();
  View.init();
  runApp(TheCocktailApp());
}

class TheCocktailApp extends StatelessWidget {
  final _coreRouter = Core.routeBuilder(View.getFeatureRouter());

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: 'The Cocktail App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routerDelegate: _coreRouter.delegate(),
        routeInformationParser: _coreRouter.defaultRouteParser());
  }
}