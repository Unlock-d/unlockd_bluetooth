import 'package:devtools_extensions/devtools_extensions.dart';
import 'package:flutter/material.dart';
import 'package:unlockd_bluetooth_devtools_extension/unlockd_devtools_extension.dart';

void main() {
  runApp(const FooDevToolsExtension());
}

class FooDevToolsExtension extends StatelessWidget {
  const FooDevToolsExtension({super.key});

  @override
  Widget build(BuildContext context) {

    // After this you can use extensionManager and serviceManager to send messages back and forth with DevTools or interact with the connected app.
    return const DevToolsExtension(
      child: UnlockdDevtoolsExtension(), // Build your extension here
    );
  }
}