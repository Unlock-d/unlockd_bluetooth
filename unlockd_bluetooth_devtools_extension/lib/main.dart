import 'package:devtools_extensions/devtools_extensions.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FooDevToolsExtension());
}

class FooDevToolsExtension extends StatelessWidget {
  const FooDevToolsExtension({super.key});

  @override
  Widget build(BuildContext context) {

    // After this you can use extensionManager and serviceManager to send messages back and forth with DevTools or interact with the connected app.
    return const DevToolsExtension(
      child: Text('Hello world'), // Build your extension here
    );
  }
}