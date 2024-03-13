// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:unlockd_bluetooth_core/unlockd_bluetooth.dart';

class FbpBluetoothConnector extends UnlockdBluetoothConnector {
  static late StreamSubscription<void>? _adapterStateSubscription;

  @override
  Map<UnlockdBluetoothConnectAction, Function> get handlers => {
        UnlockdBluetoothConnectAction.listInstances: _listInstances,
        UnlockdBluetoothConnectAction.turnOn: _turnOnAdapter,
        UnlockdBluetoothConnectAction.turnOff: _turnOffAdapter,
        UnlockdBluetoothConnectAction.listSystemDevices: _listSystemDevices,
        UnlockdBluetoothConnectAction.adapterState: _adapterState,
        UnlockdBluetoothConnectAction.isScanningNow: _notImplemented,
        UnlockdBluetoothConnectAction.isScanning: _notImplemented,
        UnlockdBluetoothConnectAction.startScan: _notImplemented,
        UnlockdBluetoothConnectAction.stopScan: _notImplemented,
        UnlockdBluetoothConnectAction.systemDevices: _notImplemented,
        UnlockdBluetoothConnectAction.scanResults: _notImplemented,
        UnlockdBluetoothConnectAction.onScanResults: _notImplemented,
      };

  Future<dynamic> _listInstances(
    Map<String, dynamic> parameters,
  ) async {
    return ConnectInstanceNamesResponse(super.instances.keys.toList());
  }

  Future<dynamic> _turnOnAdapter(Map<String, dynamic> parameters) async {
    try {
      //only on android
      if (Platform.isAndroid) {
        await FlutterBluePlus.turnOn();
        return SuccessTurnOnAdapterResponse();
      } else {
        return ErrorTurnOnAdapterResponse(
          message: 'Not supported on this platform',
        );
      }
    } catch (e) {
      log('Error turning on adapter: $e');
      return ErrorTurnOnAdapterResponse(
        message: e.toString(),
      );
    }
  }

  static Future<dynamic> _turnOffAdapter(
    Map<String, dynamic> _,
  ) async {
    try {
      //only on android
      if (Platform.isAndroid) {
        await FlutterBluePlus.turnOff();
        return SuccessTurnOffAdapterResponse();
      } else {
        return ErrorTurnOffAdapterResponse(
          message: 'Not supported on this platform',
        );
      }
    } catch (e) {
      log('Error turning on adapter: $e');
      return ErrorTurnOffAdapterResponse(
        message: e.toString(),
      );
    }
  }

  static Future<dynamic> _listSystemDevices(
    Map<String, dynamic> _,
  ) async {
    final bluetoothDevices = await FlutterBluePlus.systemDevices.then(
      (list) => list
          .map(
            (e) => ConnectedSystemDevice(
              identifier: e.remoteId.str,
              name: e.platformName,
              isConnected: e.isConnected,
            ),
          )
          .toList(),
    );

    return ConnectSystemDevicesResponse(bluetoothDevices);
  }

  Future<dynamic> _adapterState(Map<String, dynamic> static) async {
    print('Adapter state requested');
    //await _adapterStateSubscription?.cancel();

    _adapterStateSubscription = FlutterBluePlus.adapterState.listen((event) {
      print('Adapter state changed: $event');
      postEvent(
        UnlockdBluetoothConnectEvent.adapterStateChanged.event,
        ConnectAdapterStateResponse(event.name).toJson(),
      );
    });
  }

  Future<dynamic> _notImplemented(Map<String, dynamic> _) async {
    throw UnimplementedError();
  }
}
