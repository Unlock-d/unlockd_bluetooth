// Copyright 2023, Charles Weinberger & Paul DeMarco.
// All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:unlockd_bluetooth/unlockd_bluetooth.dart';

import 'widgets.dart';

final snackBarKeyA = GlobalKey<ScaffoldMessengerState>();
final snackBarKeyB = GlobalKey<ScaffoldMessengerState>();
final snackBarKeyC = GlobalKey<ScaffoldMessengerState>();
final Map<String, ValueNotifier<bool>>
    isConnectingOrDisconnecting = {};

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const isEmulator = true;
  await UnlockdBluetooth.initialize(
    isEmulator: isEmulator,
  );
  final bluetooth = UnlockdBluetooth.instance;

  if (Platform.isAndroid) {
    [
      Permission.location,
      Permission.storage,
      Permission.manageExternalStorage,
      Permission.bluetooth,
      Permission.bluetoothConnect,
      Permission.bluetoothScan,
    ].request().then((status) {
      runApp(FlutterBlueApp(bluetooth: bluetooth));
    });
  } else {
    runApp(FlutterBlueApp(bluetooth: bluetooth));
  }
}

class BluetoothAdapterStateObserver extends NavigatorObserver {
  BluetoothAdapterStateObserver(this.bluetooth);

  final UnlockdBluetooth bluetooth;
  StreamSubscription<UnlockdBluetoothAdapterState>? _btStateSubscription;

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    if (route.settings.name == '/deviceScreen') {
      // Start listening to Bluetooth state changes when a new route is pushed
      _btStateSubscription ??= bluetooth.adapterState().listen((state) {
        if (state != UnlockdBluetoothAdapterState.on) {
          // Pop the current route if Bluetooth is off
          navigator?.pop();
        }
      });
    }
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    // Cancel the subscription when the route is popped
    _btStateSubscription?.cancel();
    _btStateSubscription = null;
  }
}

class FlutterBlueApp extends StatelessWidget {
  const FlutterBlueApp({Key? key, required this.bluetooth}) : super(key: key);

  final UnlockdBluetooth bluetooth;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.lightBlue,
      home: StreamBuilder<UnlockdBluetoothAdapterState>(
          stream: bluetooth.adapterState(),
          initialData: UnlockdBluetoothAdapterState.unknown,
          builder: (c, snapshot) {
            final adapterState = snapshot.data;
            if (adapterState == UnlockdBluetoothAdapterState.on) {
              return FindDevicesScreen(
                bluetooth: bluetooth,
              );
            } else {
              bluetooth.stopScan();
              return BluetoothOffScreen(
                adapterState: adapterState,
                bluetooth: bluetooth,
              );
            }
          }),
      navigatorObservers: [BluetoothAdapterStateObserver(bluetooth)],
    );
  }
}

class BluetoothOffScreen extends StatelessWidget {
  const BluetoothOffScreen({
    Key? key,
    this.adapterState,
    required this.bluetooth,
  }) : super(key: key);

  final UnlockdBluetooth bluetooth;
  final UnlockdBluetoothAdapterState? adapterState;

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: snackBarKeyA,
      child: Scaffold(
        backgroundColor: Colors.lightBlue,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Icon(
                Icons.bluetooth_disabled,
                size: 200.0,
                color: Colors.white54,
              ),
              Text(
                'Bluetooth Adapter is ${adapterState != null ? adapterState.toString().split(".").last : 'not available'}.',
                style: Theme.of(context)
                    .primaryTextTheme
                    .titleSmall
                    ?.copyWith(color: Colors.white),
              ),
              if (Platform.isAndroid)
                ElevatedButton(
                  child: const Text('TURN ON'),
                  onPressed: () async {
                    try {
                      if (Platform.isAndroid) {
                        await bluetooth.turnOn();
                      }
                    } catch (e) {
                      final snackBar =
                          snackBarFail(prettyException("Error Turning On:", e));
                      snackBarKeyA.currentState?.removeCurrentSnackBar();
                      snackBarKeyA.currentState?.showSnackBar(snackBar);
                    }
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class FindDevicesScreen extends StatefulWidget {
  const FindDevicesScreen({Key? key, required this.bluetooth})
      : super(key: key);

  final UnlockdBluetooth bluetooth;

  @override
  State<FindDevicesScreen> createState() => _FindDevicesScreenState();
}

class _FindDevicesScreenState extends State<FindDevicesScreen> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: snackBarKeyB,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Find Devices'),
        ),
        body: RefreshIndicator(
          onRefresh: () {
            setState(() {}); // force refresh of connectedSystemDevices
            if (widget.bluetooth.isScanningNow() == false) {
              widget.bluetooth.startScan(
                timeout: const Duration(seconds: 15),
                androidUsesFineLocation: false,
              );
            }
            return Future.delayed(
              const Duration(milliseconds: 500),
            ); // show refresh icon briefly
          },
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                StreamBuilder<List<UnlockdBluetoothDevice>>(
                  stream: Stream.fromFuture(widget.bluetooth.systemDevices()),
                  initialData: const [],
                  builder: (c, snapshot) => Column(
                    children: (snapshot.data ?? [])
                        .map((d) => ListTile(
                              title: Text(d.platformName),
                              subtitle: Text(d.remoteId.toString()),
                              trailing: StreamBuilder<
                                  UnlockdBluetoothConnectionState>(
                                stream: d.connectionState,
                                initialData: UnlockdBluetoothConnectionState
                                    .disconnected,
                                builder: (c, snapshot) {
                                  if (snapshot.data ==
                                      UnlockdBluetoothConnectionState
                                          .connected) {
                                    return ElevatedButton(
                                      child: const Text('OPEN'),
                                      onPressed: () => Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (context) =>
                                                  DeviceScreen(device: d),
                                              settings: const RouteSettings(
                                                  name: '/deviceScreen'))),
                                    );
                                  }
                                  if (snapshot.data ==
                                      UnlockdBluetoothConnectionState
                                          .disconnected) {
                                    return ElevatedButton(
                                        child: const Text('CONNECT'),
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) {
                                                    isConnectingOrDisconnecting[
                                                            d.remoteId] ??=
                                                        ValueNotifier(true);
                                                    isConnectingOrDisconnecting[
                                                            d.remoteId]!
                                                        .value = true;
                                                    d
                                                        .connect(
                                                            timeout:
                                                                const Duration(
                                                                    seconds:
                                                                        35))
                                                        .catchError((e) {
                                                      final snackBar =
                                                          snackBarFail(
                                                              prettyException(
                                                                  "Connect Error:",
                                                                  e));
                                                      snackBarKeyC.currentState
                                                          ?.removeCurrentSnackBar();
                                                      snackBarKeyC.currentState
                                                          ?.showSnackBar(
                                                              snackBar);
                                                    }).then((v) {
                                                      isConnectingOrDisconnecting[
                                                              d.remoteId] ??=
                                                          ValueNotifier(false);
                                                      isConnectingOrDisconnecting[
                                                              d.remoteId]!
                                                          .value = false;
                                                    });
                                                    return DeviceScreen(
                                                        device: d);
                                                  },
                                                  settings: const RouteSettings(
                                                      name: '/deviceScreen')));
                                        });
                                  }
                                  return Text(snapshot.data
                                      .toString()
                                      .toUpperCase()
                                      .split('.')[1]);
                                },
                              ),
                            ))
                        .toList(),
                  ),
                ),
                StreamBuilder<List<UnlockdScanResult>>(
                  stream: widget.bluetooth.scanResults(),
                  initialData: const [],
                  builder: (c, snapshot) => Column(
                    children: (snapshot.data ?? [])
                        .map(
                          (r) => ScanResultTile(
                            result: r,
                            onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) {
                                      isConnectingOrDisconnecting[r.device
                                          .remoteId] ??= ValueNotifier(true);
                                      isConnectingOrDisconnecting[
                                              r.device.remoteId]!
                                          .value = true;
                                      r.device
                                          .connect(
                                              timeout:
                                                  const Duration(seconds: 35))
                                          .catchError((e) {
                                        final snackBar = snackBarFail(
                                            prettyException(
                                                "Connect Error:", e));
                                        snackBarKeyC.currentState
                                            ?.removeCurrentSnackBar();
                                        snackBarKeyC.currentState
                                            ?.showSnackBar(snackBar);
                                      }).then((v) {
                                        isConnectingOrDisconnecting[r.device
                                            .remoteId] ??= ValueNotifier(false);
                                        isConnectingOrDisconnecting[
                                                r.device.remoteId]!
                                            .value = false;
                                      });
                                      return DeviceScreen(device: r.device);
                                    },
                                    settings: const RouteSettings(
                                        name: '/deviceScreen'))),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: StreamBuilder<bool>(
          stream: widget.bluetooth.isScanning(),
          initialData: false,
          builder: (c, snapshot) {
            if (snapshot.data ?? false) {
              return FloatingActionButton(
                onPressed: () async {
                  try {
                    widget.bluetooth.stopScan();
                  } catch (e) {
                    final snackBar =
                        snackBarFail(prettyException("Stop Scan Error:", e));
                    snackBarKeyB.currentState?.removeCurrentSnackBar();
                    snackBarKeyB.currentState?.showSnackBar(snackBar);
                  }
                },
                backgroundColor: Colors.red,
                child: const Icon(Icons.stop),
              );
            } else {
              return FloatingActionButton(
                  child: const Text("SCAN"),
                  onPressed: () async {
                    try {
                      await widget.bluetooth.startScan(
                          timeout: const Duration(seconds: 15),
                          androidUsesFineLocation: false);
                    } catch (e) {
                      final snackBar =
                          snackBarFail(prettyException("Start Scan Error:", e));
                      snackBarKeyB.currentState?.removeCurrentSnackBar();
                      snackBarKeyB.currentState?.showSnackBar(snackBar);
                    }
                    setState(() {}); // force refresh of connectedSystemDevices
                  });
            }
          },
        ),
      ),
    );
  }
}

class DeviceScreen extends StatelessWidget {
  final UnlockdBluetoothDevice device;

  const DeviceScreen({Key? key, required this.device}) : super(key: key);

  List<int> _getRandomBytes() {
    final math = Random();
    return [
      math.nextInt(255),
      math.nextInt(255),
      math.nextInt(255),
      math.nextInt(255)
    ];
  }

  List<Widget> _buildServiceTiles(
      BuildContext context, List<UnlockdBluetoothService> services) {
    return services
        .map(
          (s) => ServiceTile(
            service: s,
            characteristicTiles: s.characteristics
                .map(
                  (c) => CharacteristicTile(
                    characteristic: c,
                    onReadPressed: () async {
                      try {
                        await c.read();
                        final snackBar = snackBarGood("Read: Success");
                        snackBarKeyC.currentState?.removeCurrentSnackBar();
                        snackBarKeyC.currentState?.showSnackBar(snackBar);
                      } catch (e) {
                        final snackBar =
                            snackBarFail(prettyException("Read Error:", e));
                        snackBarKeyC.currentState?.removeCurrentSnackBar();
                        snackBarKeyC.currentState?.showSnackBar(snackBar);
                      }
                    },
                    onWritePressed: () async {
                      try {
                        await c.write(_getRandomBytes(),
                            withoutResponse: c.properties.writeWithoutResponse);
                        final snackBar = snackBarGood("Write: Success");
                        snackBarKeyC.currentState?.removeCurrentSnackBar();
                        snackBarKeyC.currentState?.showSnackBar(snackBar);
                        if (c.properties.read) {
                          await c.read();
                        }
                      } catch (e) {
                        final snackBar =
                            snackBarFail(prettyException("Write Error:", e));
                        snackBarKeyC.currentState?.removeCurrentSnackBar();
                        snackBarKeyC.currentState?.showSnackBar(snackBar);
                      }
                    },
                    onNotificationPressed: () async {
                      try {
                        String op = c.isNotifying == false
                            ? "Subscribe"
                            : "Unsubscribe";
                        await c.setNotifyValue(c.isNotifying == false);
                        final snackBar = snackBarGood("$op : Success");
                        snackBarKeyC.currentState?.removeCurrentSnackBar();
                        snackBarKeyC.currentState?.showSnackBar(snackBar);
                        if (c.properties.read) {
                          await c.read();
                        }
                      } catch (e) {
                        final snackBar = snackBarFail(
                            prettyException("Subscribe Error:", e));
                        snackBarKeyC.currentState?.removeCurrentSnackBar();
                        snackBarKeyC.currentState?.showSnackBar(snackBar);
                      }
                    },
                    descriptorTiles: c.descriptors
                        .map(
                          (d) => DescriptorTile(
                            descriptor: d,
                            onReadPressed: () async {
                              try {
                                await d.read();
                                final snackBar = snackBarGood("Read: Success");
                                snackBarKeyC.currentState
                                    ?.removeCurrentSnackBar();
                                snackBarKeyC.currentState
                                    ?.showSnackBar(snackBar);
                              } catch (e) {
                                final snackBar = snackBarFail(
                                    prettyException("Read Error:", e));
                                snackBarKeyC.currentState
                                    ?.removeCurrentSnackBar();
                                snackBarKeyC.currentState
                                    ?.showSnackBar(snackBar);
                              }
                            },
                            onWritePressed: () async {
                              try {
                                await d.write(_getRandomBytes());
                                final snackBar = snackBarGood("Write: Success");
                                snackBarKeyC.currentState
                                    ?.removeCurrentSnackBar();
                                snackBarKeyC.currentState
                                    ?.showSnackBar(snackBar);
                              } catch (e) {
                                final snackBar = snackBarFail(
                                    prettyException("Write Error:", e));
                                snackBarKeyC.currentState
                                    ?.removeCurrentSnackBar();
                                snackBarKeyC.currentState
                                    ?.showSnackBar(snackBar);
                              }
                            },
                          ),
                        )
                        .toList(),
                  ),
                )
                .toList(),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: snackBarKeyC,
      child: Scaffold(
        appBar: AppBar(
          title: Text(device.platformName),
          actions: <Widget>[
            StreamBuilder<UnlockdBluetoothConnectionState>(
              stream: device.connectionState,
              initialData: UnlockdBluetoothConnectionState.disconnected,
              builder: (c, snapshot) {
                VoidCallback? onPressed;
                String text;
                switch (snapshot.data) {
                  case UnlockdBluetoothConnectionState.connected:
                    onPressed = () async {
                      isConnectingOrDisconnecting[device.remoteId] ??=
                          ValueNotifier(true);
                      isConnectingOrDisconnecting[device.remoteId]!.value =
                          true;
                      try {
                        await device.disconnect();
                        final snackBar = snackBarGood("Disconnect: Success");
                        snackBarKeyC.currentState?.removeCurrentSnackBar();
                        snackBarKeyC.currentState?.showSnackBar(snackBar);
                      } catch (e) {
                        final snackBar = snackBarFail(
                            prettyException("Disconnect Error:", e));
                        snackBarKeyC.currentState?.removeCurrentSnackBar();
                        snackBarKeyC.currentState?.showSnackBar(snackBar);
                      }
                      isConnectingOrDisconnecting[device.remoteId] ??=
                          ValueNotifier(false);
                      isConnectingOrDisconnecting[device.remoteId]!.value =
                          false;
                    };
                    text = 'DISCONNECT';
                    break;
                  case UnlockdBluetoothConnectionState.disconnected:
                    onPressed = () async {
                      isConnectingOrDisconnecting[device.remoteId] ??=
                          ValueNotifier(true);
                      isConnectingOrDisconnecting[device.remoteId]!.value =
                          true;
                      try {
                        await device.connect(
                            timeout: const Duration(seconds: 35));
                        final snackBar = snackBarGood("Connect: Success");
                        snackBarKeyC.currentState?.removeCurrentSnackBar();
                        snackBarKeyC.currentState?.showSnackBar(snackBar);
                      } catch (e) {
                        final snackBar =
                            snackBarFail(prettyException("Connect Error:", e));
                        snackBarKeyC.currentState?.removeCurrentSnackBar();
                        snackBarKeyC.currentState?.showSnackBar(snackBar);
                      }
                      isConnectingOrDisconnecting[device.remoteId] ??=
                          ValueNotifier(false);
                      isConnectingOrDisconnecting[device.remoteId]!.value =
                          false;
                    };
                    text = 'CONNECT';
                    break;
                  default:
                    onPressed = null;
                    text =
                        snapshot.data.toString().split(".").last.toUpperCase();
                    break;
                }
                return ValueListenableBuilder<bool>(
                    valueListenable:
                        isConnectingOrDisconnecting[device.remoteId]!,
                    builder: (context, value, child) {
                      isConnectingOrDisconnecting[device.remoteId] ??=
                          ValueNotifier(false);
                      if (isConnectingOrDisconnecting[device.remoteId]!.value ==
                          true) {
                        // Show spinner when connecting or disconnecting
                        return const Padding(
                          padding: EdgeInsets.all(14.0),
                          child: AspectRatio(
                            aspectRatio: 1.0,
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.black12,
                              color: Colors.black26,
                            ),
                          ),
                        );
                      } else {
                        return TextButton(
                            onPressed: onPressed,
                            child: Text(
                              text,
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .labelLarge
                                  ?.copyWith(color: Colors.white),
                            ));
                      }
                    });
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              StreamBuilder<UnlockdBluetoothConnectionState>(
                stream: device.connectionState,
                initialData: UnlockdBluetoothConnectionState.disconnected,
                builder: (c, snapshot) => Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(device.remoteId),
                    ),
                    ListTile(
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          snapshot.data ==
                                  UnlockdBluetoothConnectionState.connected
                              ? const Icon(Icons.bluetooth_connected)
                              : const Icon(Icons.bluetooth_disabled),
                          snapshot.data ==
                                  UnlockdBluetoothConnectionState.connected
                              ? StreamBuilder<int>(
                                  stream: rssiStream(maxItems: 1),
                                  builder: (context, snapshot) {
                                    return Text(
                                        snapshot.hasData
                                            ? '${snapshot.data}dBm'
                                            : '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall);
                                  })
                              : Text('',
                                  style: Theme.of(context).textTheme.bodySmall),
                        ],
                      ),
                      title: Text(
                          'Device is ${snapshot.data.toString().split('.')[1]}.'),
                    ),
                  ],
                ),
              ),
              StreamBuilder<int>(
                stream: device.mtu,
                initialData: 0,
                builder: (c, snapshot) => ListTile(
                  title: const Text('MTU Size'),
                  subtitle: Text('${snapshot.data} bytes'),
                  trailing: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () async {
                        try {
                          await device.requestMtu(223);
                          final snackBar = snackBarGood("Request Mtu: Success");
                          snackBarKeyC.currentState?.removeCurrentSnackBar();
                          snackBarKeyC.currentState?.showSnackBar(snackBar);
                        } catch (e) {
                          final snackBar = snackBarFail(
                              prettyException("Change Mtu Error:", e));
                          snackBarKeyC.currentState?.removeCurrentSnackBar();
                          snackBarKeyC.currentState?.showSnackBar(snackBar);
                        }
                      }),
                ),
              ),
              ..._buildServiceTiles(context, device.servicesList),
            ],
          ),
        ),
      ),
    );
  }

  Stream<int> rssiStream({
    Duration frequency = const Duration(seconds: 5),
    int? maxItems,
  }) async* {
    var isConnected = true;
    final subscription = device.connectionState.listen((v) {
      isConnected = v == UnlockdBluetoothConnectionState.connected;
    });
    int i = 0;
    while (isConnected && (maxItems == null || i < maxItems)) {
      try {
        yield await device.readRssi();
      } catch (e) {
        if (kDebugMode) {
          print("Error reading RSSI: $e");
        }
        break;
      }
      await Future.delayed(frequency);
      i++;
    }
    // Device disconnected, stopping RSSI stream
    subscription.cancel();
  }
}

String prettyException(String prefix, dynamic e) {
  if (e is PlatformException) {
    return "$prefix ${e.message}";
  }
  return prefix + e.toString();
}
