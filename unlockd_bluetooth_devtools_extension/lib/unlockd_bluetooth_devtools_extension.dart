import 'package:devtools_extensions/devtools_extensions.dart';
import 'package:flutter/material.dart';
import 'package:unlockd_bluetooth_core/unlockd_bluetooth.dart';

import 'features/features.dart';

class UnlockdBluetoothDevtoolsExtension extends StatefulWidget {
  const UnlockdBluetoothDevtoolsExtension({
    super.key,
  });

  @override
  State<UnlockdBluetoothDevtoolsExtension> createState() =>
      _UnlockdBluetoothDevtoolsExtensionState();
}

class _UnlockdBluetoothDevtoolsExtensionState
    extends State<UnlockdBluetoothDevtoolsExtension> {
  ///TODO record active scan and allow playback of found devices
  @override
  Widget build(BuildContext context) {
    return NavigationBarView(
      items: [
        NavigationBarItem(
          header: const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          content: const Text("home"),
        ),
        NavigationBarItem(
          header: const BottomNavigationBarItem(
            icon: Icon(Icons.bluetooth),
            label: 'Bluetooth Information',
          ),
          content: const InformationOverviewView(),
        ),
      ],
    );
  }
}
