import 'package:flutter/foundation.dart';

enum Flavor {
  development,
  production,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.development:
        if(kReleaseMode){
          return Uri.encodeFull('Scottish Premier League');
        } else {
          return Uri.encodeFull('German Bundesliga');
        }
      case Flavor.production:
        if(kReleaseMode){
          return Uri.encodeFull('English Premier League');
        } else {
          return Uri.encodeFull('English League Championship');
        }
      default:
        return 'title';
    }
  }

}
