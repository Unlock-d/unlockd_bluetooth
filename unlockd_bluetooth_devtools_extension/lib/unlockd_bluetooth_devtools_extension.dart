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
            icon: Icon(Icons.bluetooth),
            label: 'Bluetooth Information',
          ),
          content: const InformationOverviewView(),
        ),
        NavigationBarItem(
          header: const BottomNavigationBarItem(
            icon: Icon(Icons.info_rounded),
            label: 'About',
          ),
          content: const Column(
            children: [
              Text(
                  "This is a devtools extension for the unlockd_bluetooth package."),
              Text("It is a work in progress."),
              Text("It is not yet functional."),
            ],
          ),
        ),
      ],
    );
  }
}
