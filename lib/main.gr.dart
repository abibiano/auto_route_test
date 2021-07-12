// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import 'main.dart' as _i3;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    HomePageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i3.HomePage();
        }),
    SecondPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<SecondPageRouteArgs>();
          return _i3.SecondPage(
              key: args.key,
              item: args.item,
              onButtonPressed: args.onButtonPressed);
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(HomePageRoute.name, path: '/'),
        _i1.RouteConfig(SecondPageRoute.name, path: '/second-page')
      ];
}

class HomePageRoute extends _i1.PageRouteInfo {
  const HomePageRoute() : super(name, path: '/');

  static const String name = 'HomePageRoute';
}

class SecondPageRoute extends _i1.PageRouteInfo<SecondPageRouteArgs> {
  SecondPageRoute(
      {_i2.Key? key,
      required String item,
      required void Function(String) onButtonPressed})
      : super(name,
            path: '/second-page',
            args: SecondPageRouteArgs(
                key: key, item: item, onButtonPressed: onButtonPressed));

  static const String name = 'SecondPageRoute';
}

class SecondPageRouteArgs {
  const SecondPageRouteArgs(
      {this.key, required this.item, required this.onButtonPressed});

  final _i2.Key? key;

  final String item;

  final void Function(String) onButtonPressed;
}
