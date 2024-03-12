// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:unlockd_bluetooth_core/unlockd_bluetooth.dart';

abstract class FbpBluetoothConnect {
  static const _handlers = {
    ConnectAction.listInstances: _listInstances,
    ConnectAction.turnOn: _turnOnAdapter,
    ConnectAction.turnOff: _turnOffAdapter,
    ConnectAction.listSystemDevices: _listSystemDevices,
    ConnectAction.adapterState: _adapterState,
    ConnectAction.isScanningNow: _notImplemented,
    ConnectAction.isScanning: _notImplemented,
    ConnectAction.startScan: _notImplemented,
    ConnectAction.stopScan: _notImplemented,
    ConnectAction.systemDevices: _notImplemented,
    ConnectAction.scanResults: _notImplemented,
    ConnectAction.onScanResults: _notImplemented,
  };

  static final _instances = <String, UnlockdBluetoothProvider>{};
  static var _initialized = false;

  static late StreamSubscription<void>? _adapterStateSubscription;

  static void initialize(UnlockdBluetoothProvider bluetoothProvider) {
    if (!_initialized) {
      _initialized = true;
      _printConnection();
      _registerHandlers();
    }

    if (!_instances.containsKey(bluetoothProvider.name)) {
      _instances[bluetoothProvider.name] = bluetoothProvider;
      postEvent(ConnectEvent.instancesChanged.event, {});
    }
  }

  static void _registerHandlers() {
    for (final handler in _handlers.entries) {
      registerExtension(handler.key.method, (method, parameters) async {
        try {
          final args = parameters.containsKey('args')
              ? jsonDecode(parameters['args']!) as Map<String, dynamic>
              : <String, dynamic>{};
          final result = <String, dynamic>{'result': await handler.value(args)};
          return ServiceExtensionResponse.result(jsonEncode(result));
        } catch (e) {
          return ServiceExtensionResponse.error(
            ServiceExtensionResponse.extensionError,
            e.toString(),
          );
        }
      });
    }
  }

  static void _printConnection() {
    Service.getInfo().then((ServiceProtocolInfo info) {
      final serviceUri = info.serverUri;
      if (serviceUri == null) {
        return;
      }

      final url = serviceUri.toString();

      String line(String text, String fill) {
        final fillCount = url.length - text.length;
        // If the text is longer than the url, just return the text.
        if (fillCount <= 0) {
          return text;
        }
        final left = List.filled(fillCount ~/ 2, fill);
        final right = List.filled(fillCount - left.length, fill);
        return left.join() + text + right.join();
      }

      print('╔${line('', '═')}╗');
      print('║${line('UNLOCKD BLUETOOTH CONNECT STARTED', ' ')}║');
      print('╟${line('', '─')}╢');
      print(
        '║${line(
          'Open the link to connect to the Unlockd Bluetooth Provider',
          ' ',
        )}║',
      );
      print('╟${line('', '─')}╢');
      print('║$url║');
      print('╚${line('', '═')}╝');
    });
  }

  static Future<dynamic> _listInstances(
    Map<String, dynamic> _,
  ) async {
    return ConnectInstanceNamesPayload(_instances.keys.toList());
  }

  static Future<dynamic> _turnOnAdapter(
    Map<String, dynamic> _,
  ) async {
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

  static Future<dynamic> _adapterState(Map<String, dynamic> _) async {
    print('Adapter state requested');
    //await _adapterStateSubscription?.cancel();

    _adapterStateSubscription = FlutterBluePlus.adapterState.listen((event) {
      print('Adapter state changed: $event');
      postEvent(
        ConnectEvent.adapterStateChanged.event,
        ConnectAdapterStateResponse(event.name).toJson(),
      );
    });
  }

  static Future<dynamic> _notImplemented(Map<String, dynamic> _) async {
    throw UnimplementedError();
  }
}
