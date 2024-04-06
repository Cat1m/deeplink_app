import 'dart:developer';
import 'package:deeplink_app/green.dart';
import 'package:deeplink_app/red.dart';
import 'package:deeplink_app/services/context_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uni_links/uni_links.dart';

class UniServices {
  static String _code = '';
  static String get code => _code;
  static bool get hasCode => _code.isNotEmpty;

  static void reset() => _code = '';

  static init() async {
    try {
      final Uri? uri = await getInitialUri();
      uniHander(uri);
    } on PlatformException {
      log('Failed to receive the code');
    } on FormatException {
      log('Wrong format code recceived');
    }

    uriLinkStream.listen((Uri? uri) async {
      uniHander(uri);
    }, onError: (error) {
      log('OnUriLink Error: $error');
    });
  }

  static uniHander(Uri? uri) {
    if (uri == null || uri.queryParameters.isEmpty) return;

    Map<String, String> param = uri.queryParameters;

    String receivedCode = param['code'] ?? '';

    if (receivedCode == 'green') {
      Navigator.push(
          ContextUtility.context!,
          MaterialPageRoute(
            builder: (_) => const GreenScreen(),
          ));
    } else {
      Navigator.push(
          ContextUtility.context!,
          MaterialPageRoute(
            builder: (_) => const RedScreen(),
          ));
    }
  }
}
