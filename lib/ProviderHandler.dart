// ignore_for_file: file_names

import 'package:provider/provider.dart';
import 'package:talky_chat/app/App.dart';
import 'package:talky_chat/controllers/ChatsScreenControllerImpl.dart';
import 'package:talky_chat/controllers/NavigatorControllerImpl.dart';
import 'package:talky_chat/controllers/ProfileScreenControllerImpl.dart';
import 'package:talky_chat/controllers/SignInSocialScreenControllerImpl.dart';
import 'package:talky_chat/controllers/SignUpScreenControllerImpl.dart';
import 'package:talky_chat/controllers/interfaces/ChatsScreenController.dart';
import 'package:talky_chat/controllers/interfaces/NavigatorController.dart';
import 'package:talky_chat/controllers/interfaces/ProfileScreenController.dart';
import 'package:talky_chat/controllers/interfaces/SignInSocialScreenController.dart';
import 'package:talky_chat/controllers/interfaces/SignUpScreenController.dart';
import 'package:talky_chat/services/FirebaseAuthService.dart';

import 'package:talky_chat/services/ContactsServiceImpl.dart';
import 'package:talky_chat/services/FirestoreDBService.dart';
import 'package:talky_chat/services/LogServiceImpl.dart';
import 'package:talky_chat/services/MediaPickerServiceImpl.dart';
import 'package:talky_chat/services/NavigatorServiceImpl.dart';
import 'package:talky_chat/services/interfaces/AuthService.dart';
import 'package:talky_chat/services/interfaces/CloudDBService.dart';
import 'package:talky_chat/services/interfaces/ContactsService.dart';
import 'package:talky_chat/services/interfaces/LogService.dart';
import 'package:talky_chat/services/interfaces/MediaPickerService.dart';
import 'package:talky_chat/services/interfaces/NavigatorService.dart';

import 'package:talky_chat/repository/ContactsRepositoryImpl.dart';
import 'package:talky_chat/repository/interfaces/ContactsRepository.dart';
import 'package:talky_chat/repository/AvailabilityStatusRepositoryImpl.dart';
import 'package:talky_chat/repository/interfaces/AvailabilityStatusRepository.dart';

import 'package:talky_chat/providers/CurrentUserProvider.dart';

// TODO: Desenvolver repositorio e servicos de chat
// TODO: Organizar providerHandler

MultiProvider providerHandler = MultiProvider(
  providers: [
    ChangeNotifierProvider<CurrentUserProvider>(
      create: (context) => CurrentUserProvider(),
    ),
    Provider<LogService>(
      create: (context) => LogServiceImpl.instance,
    ),
    Provider<NavigatorService>(
      create: (context) => NavigatorServiceImpl.instance,
    ),
    Provider<MediaPickerService>(
      create: (context) => MediaPickerServiceImpl.instance,
    ),
    Provider<AuthService>(
      create: (context) => FirebaseAuthService.instance,
    ),
    Provider<ContactsRepository>(
      create: (context) => ContactsRepositoryImpl(),
    ),
    Provider<AvailabilityStatusRepository>(
      create: (context) => AvailabilityStatusRepositoryImpl(),
    ),
    ProxyProvider<ContactsRepository, ContactsService>(
      update: (
        context,
        contactsRepository,
        previous,
      ) =>
          ContactsServiceImpl(repository: contactsRepository),
    ),
    ProxyProvider<CurrentUserProvider, CloudDBService>(
      update: (
        context,
        currentUser,
        previous,
      ) =>
          FirestoreDBService(currentUser: currentUser),
    ),
    ProxyProvider<NavigatorService, NavigatorController>(
      update: (
        context,
        value,
        previous,
      ) =>
          NavigatorControllerImpl(navigatorService: value),
    ),
    ProxyProvider3<NavigatorController, ContactsService, CurrentUserProvider,
        ChatsScreenController>(
      update: (
        context,
        navController,
        contactsService,
        currentUser,
        previous,
      ) =>
          ChatsScreenControllerImpl(
        navigatorController: navController,
        contactsService: contactsService,
        currentUser: currentUser,
      ),
    ),
    ProxyProvider4<NavigatorController, AuthService, CloudDBService,
        CurrentUserProvider, SignUpScreenController>(
      update: (
        context,
        navController,
        authService,
        CDBService,
        currentUser,
        previous,
      ) =>
          SignUpScreenControllerImpl(
        context: context,
        authService: authService,
        CDBService: CDBService,
        navigatorController: navController,
        currentUser: currentUser,
      ),
    ),
    ProxyProvider4<NavigatorController, MediaPickerService, CloudDBService,
        CurrentUserProvider, ProfileScreenController>(
      update: (
        context,
        navController,
        mediaPickerService,
        CDBService,
        currentUser,
        previous,
      ) =>
          ProfileScreenControllerImpl(
        navigatorController: navController,
        CDBService: CDBService,
        mediaPickerService: mediaPickerService,
        currentUser: currentUser,
      ),
    ),
    ProxyProvider4<NavigatorController, AuthService, CloudDBService,
        CurrentUserProvider, SignInSocialScreenController>(
      update: (
        context,
        navController,
        authService,
        CDBService,
        currentUser,
        previous,
      ) =>
          SignInSocialScreenControllerImpl(
        context: context,
        authService: authService,
        CDBService: CDBService,
        navigatorController: navController,
        currentUser: currentUser,
      ),
    ),
  ],
  child: const App(),
);
