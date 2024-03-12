import 'dart:async';

import 'package:devtools_extensions/devtools_extensions.dart';
import 'package:flutter/material.dart';
import 'package:unlockd_bluetooth_devtools_extension/unlockd_bluetooth_devtools_extension.dart';

Future<void> main() async {
  runApp(
    const UnlockdFlutterBluePlusProviderDevToolsExtension(),
  );
}

class UnlockdFlutterBluePlusProviderDevToolsExtension extends StatelessWidget {
  const UnlockdFlutterBluePlusProviderDevToolsExtension({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const DevToolsExtension(
      requiresRunningApplication: false,
      child: UnlockdBluetoothDevtoolsExtension(), // Build your extension here
    );
  }
}
