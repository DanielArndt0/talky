// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talky_chat/app/AppTheme.dart';
import 'package:talky_chat/NamedRoutes.dart';
import 'package:talky_chat/Routes.dart';
import 'package:talky_chat/services/interfaces/LogService.dart';
import 'package:talky_chat/services/interfaces/NavigatorService.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final LogService logService;
  late final NavigatorService navigatorService;
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  @override
  void initState() {
    logService = context.read<LogService>();
    navigatorService = context.read<NavigatorService>();
    navigatorService.setNavigator(navigator: _navigatorKey);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Talky Chat',
      theme: AppTheme.currentTheme,
      initialRoute: NamedRoutes.signIn,
      routes: Routes.handler,
      navigatorKey: _navigatorKey,
      // navigatorObservers: [NavigatorMiddleware()], // TODO Injetar Log Service
    );
  }
}
