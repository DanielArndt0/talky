// ignore_for_file: file_names

import 'package:flutter/material.dart';

abstract class NavigatorService {
  Future navigateTo<T>(String routeName, T? args);
  Future navigateToAndRemove<T>(String routeName, T? args);
  void setNavigator({required GlobalKey<NavigatorState> navigator});
  BuildContext? get context;
}
