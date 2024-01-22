// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:talky_chat/NamedRoutes.dart';
import 'package:talky_chat/services/interfaces/NavigatorService.dart';

class NavigatorServiceImpl extends NavigatorService {
  NavigatorServiceImpl._();
  static final NavigatorServiceImpl instance = NavigatorServiceImpl._();

  late final GlobalKey<NavigatorState> _navigatorKey;

  @override
  Future navigateToAndRemove<T>(String routeName, T? args) async =>
      await _navigatorKey.currentState?.pushNamedAndRemoveUntil(
        routeName,
        arguments: args,
        ModalRoute.withName(NamedRoutes.home),
      );

  @override
  Future navigateTo<T>(String routeName, T? args) async =>
      await _navigatorKey.currentState?.pushNamed(routeName, arguments: args);

  @override
  void setNavigator({required GlobalKey<NavigatorState> navigator}) =>
      _navigatorKey = navigator;

  @override
  BuildContext? get context => _navigatorKey.currentContext;
}
