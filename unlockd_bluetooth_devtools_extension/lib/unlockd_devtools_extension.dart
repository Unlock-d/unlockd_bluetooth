import 'dart:async';
import 'dart:developer';

import 'package:devtools_app_shared/service.dart';
import 'package:devtools_extensions/devtools_extensions.dart';
import 'package:flutter/material.dart';
import 'package:unlockd_bluetooth_core/unlockd_bluetooth.dart';

class UnlockdDevtoolsExtension extends StatefulWidget {
  const UnlockdDevtoolsExtension({super.key});

  @override
  State<UnlockdDevtoolsExtension> createState() =>
      _UnlockdDevtoolsExtensionState();
}

class _UnlockdDevtoolsExtensionState extends State<UnlockdDevtoolsExtension> {
  final things = ValueNotifier<Map<String, String>>({});

  Future<void> _refreshThings() async {
    try {
      final response = await serviceManager
          .callServiceExtensionOnMainIsolate('ext.bluetooth.getController');
      things.value = response.json?.cast<String, String>() ?? {};
    } catch (e) {
      print('Error fetching all things: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    unawaited(_refreshThings());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: _refreshThings,
          child: const Text('Refresh things'),
        ),
        const SizedBox(height: 12),
        ValueListenableBuilder(
          valueListenable: things,
          builder: (context, things, _) {
            return Column(
              children: [
                for (var thing in things.entries)
                  Text('${thing.key}: ${thing.value}'),
              ],
            );
          },
        ),
      ],
    );
  }
}
