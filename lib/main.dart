import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  Future.wait([
    initializeParse(),
    Locales.init(['en', 'pt']),
  ]);
  runApp(const CrossRankingApp());
}

void setupLocator() {}

Future<void> initializeParse() async {
  await Parse().initialize(
    '7NIBjCX1Qd3ck9NkxFm9tSJBReFwkTo6JppVx7l4',
    'https://parseapi.back4app.com/',
    clientKey: 'D4fM0CpGl3fXWp6x1Zgp7m5dTO3c09yvGQJUxEaE',
    autoSendSessionId: true,
    // coreStore: await CoreStoreSembastImp.getInstance(null),
    debug: true,
  );
}
