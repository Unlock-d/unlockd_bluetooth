// Copyright 2023, Charles Weinberger & Paul DeMarco.
// All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:unlockd_bluetooth_core/unlockd_bluetooth.dart';
import 'package:unlockd_flutter_blue_plus_provider/unlockd_flutter_blue_plus_provider.dart';
import 'package:unlockd_isar_provider/unlockd_isar_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid) {
    [
      Permission.location,
      Permission.storage,
      Permission.manageExternalStorage,
      Permission.bluetooth,
      Permission.bluetoothConnect,
      Permission.bluetoothScan,
    ].request().then((status) {
      runApp(const UnlockdBluetoothApp());
    });
  } else {
    runApp(const UnlockdBluetoothApp());
  }
}

Future<UnlockdBluetooth> initializeBluetooth() async {
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    unlockdBluetoothSchemas,
    directory: dir.path,
  );

  UnlockdBluetooth bluetooth = UnlockdBluetooth.initialize(
    provider: FbpBluetoothProvider.instance,
    emulationProvider: await IsarBluetoothProvider.initialize(
      isar: isar,
      initialize: (_) async {},
    ),
    shouldEmulate: true,
  );

  return bluetooth;
}

class UnlockdBluetoothApp extends StatefulWidget {
  const UnlockdBluetoothApp({super.key});

  @override
  State<UnlockdBluetoothApp> createState() => _UnlockdBluetoothAppState();
}

class _UnlockdBluetoothAppState extends State<UnlockdBluetoothApp> {
  late final Future<UnlockdBluetooth> bluetooth;

  @override
  void initState() {
    bluetooth = initializeBluetooth();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder<UnlockdBluetooth>(
          future: bluetooth,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }

            if (!snapshot.hasData || snapshot.data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            final bluetooth = snapshot.data!;

            return StreamBuilder(
              stream: bluetooth.adapterState(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                }

                if (!snapshot.hasData || snapshot.data == null) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                final adapterState = snapshot.data!;

                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Bluetooth Adapter State: $adapterState'),
                      ElevatedButton(
                        onPressed: () async {
                          await bluetooth.startScan();
                        },
                        child: const Text('Start Scan'),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
