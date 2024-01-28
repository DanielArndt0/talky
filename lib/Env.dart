import 'package:talky_chat/Errors/EnvironmentException.dart';

class _Labels {
  static const String projectId = 'projectId';
  static const String messagingSenderId = 'messagingSenderId';
  static const String storageBucket = 'storageBucket';
  static const String androidApiKey = 'androidApiKey';
  static const String androidAppId = 'androidAppId';
  static const String iosApiKey = 'iosApiKey';
  static const String iosAppId = 'iosAppId';
  static const String iosClientId = 'iosClientId';
  static const String iosBundleId = 'iosBundleId';
  static const String webApiKey = 'webApiKey';
  static const String webAppId = 'webAppId';
  static const String authDomain = 'authDomain';
  static const String measurementId = 'measurementId';
}

class Env {
  static const Map<String, String> _keys = {
    _Labels.projectId: String.fromEnvironment(_Labels.projectId),
    _Labels.messagingSenderId:
        String.fromEnvironment(_Labels.messagingSenderId),
    _Labels.storageBucket: String.fromEnvironment(_Labels.storageBucket),
    _Labels.androidApiKey: String.fromEnvironment(_Labels.androidApiKey),
    _Labels.androidAppId: String.fromEnvironment(_Labels.androidAppId),
    _Labels.iosApiKey: String.fromEnvironment(_Labels.iosApiKey),
    _Labels.iosAppId: String.fromEnvironment(_Labels.iosAppId),
    _Labels.iosClientId: String.fromEnvironment(_Labels.iosClientId),
    _Labels.iosBundleId: String.fromEnvironment(_Labels.iosBundleId),
    _Labels.webApiKey: String.fromEnvironment(_Labels.webApiKey),
    _Labels.webAppId: String.fromEnvironment(_Labels.webAppId),
    _Labels.authDomain: String.fromEnvironment(_Labels.authDomain),
    _Labels.measurementId: String.fromEnvironment(_Labels.measurementId),
  };

  static String get(String key) {
    final val = _keys[key] ?? '';
    if (val.isEmpty) {
      throw EnvironmentException(code: key, message: '$key is no set in Env');
    }
    return val;
  }

  static String get projectId => get(_Labels.projectId);
  static String get messagingSenderId => get(_Labels.messagingSenderId);
  static String get storageBucket => get(_Labels.storageBucket);
  static AndroidEnv get android => AndroidEnv.get;
  static IosEnv get ios => IosEnv.get;
  static WebEnv get web => WebEnv.get;
}

class AndroidEnv {
  AndroidEnv._();
  static final AndroidEnv get = AndroidEnv._();

  String get apiKey => Env.get(_Labels.androidApiKey);
  String get appId => Env.get(_Labels.androidAppId);
}

class IosEnv {
  IosEnv._();
  static final IosEnv get = IosEnv._();

  String get apiKey => Env.get(_Labels.iosApiKey);
  String get appId => Env.get(_Labels.iosAppId);
  String get clientId => Env.get(_Labels.iosClientId);
  String get bundleId => Env.get(_Labels.iosBundleId);
}

class WebEnv {
  WebEnv._();
  static final WebEnv get = WebEnv._();

  String get apiKey => Env.get(_Labels.webApiKey);
  String get appId => Env.get(_Labels.webAppId);
  String get authDomain => Env.get(_Labels.authDomain);
  String get measurementId => Env.get(_Labels.measurementId);
}
