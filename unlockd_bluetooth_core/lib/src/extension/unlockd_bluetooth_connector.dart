import 'dart:convert';
import 'dart:developer';

import 'package:unlockd_bluetooth_core/unlockd_bluetooth.dart';

abstract class UnlockdBluetoothConnector {
  Map<UnlockdBluetoothConnectAction, Function> get handlers;

  final Map<String, UnlockdBluetoothAdapter> _instances =
      <String, UnlockdBluetoothAdapter>{};

  Map<String, UnlockdBluetoothAdapter> get instances => _instances;
  var _initialized = false;

  void initialize(UnlockdBluetoothAdapter bluetoothProvider) {
    if (!_initialized) {
      _initialized = true;
      _printConnection();
      _registerHandlers();
    }

    if (!_instances.containsKey(bluetoothProvider.name)) {
      _instances[bluetoothProvider.name] = bluetoothProvider;
      postEvent(UnlockdBluetoothConnectEvent.instancesChanged.event, {});
    }
  }

  void _registerHandlers() {
    for (final handler in handlers.entries) {
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
}
