import 'dart:io';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'di.dart';
import 'generated/l10n.dart';
import 'my_app.dart';
import 'my_http_overrides.dart';

// Tip: if Image.remote() failed to load/renderer images then:
//  - on Mobile/Emulators try to override HttpOverrides.global if images fail to renderer
//  - on Flutter Web add the "--web-renderer html" arguments

void main() async {
  // Prepare dependencies
  await configureDependencies(environmentFilter: SimpleEnvironmentFilter(filter: (_) => true));
  // Fix a certificate issue loading https images with Image.remote()
  HttpOverrides.global = MyHttpOverrides();
  // Preload localization in advance to make it available in the MaterialApp of MyApp
  await S.load(const Locale('en'));
  // Now, run the app
  runApp(const MyApp());
}
