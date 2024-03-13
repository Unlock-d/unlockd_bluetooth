// ignore_for_file: implementation_imports

import 'dart:async';
import 'dart:convert';

import 'package:devtools_extensions/devtools_extensions.dart';
import 'package:flutter/foundation.dart';
import 'package:unlockd_bluetooth_core/unlockd_bluetooth.dart';
import 'package:unlockd_bluetooth_devtools_extension/features/connection/model/instances.dart';
import 'package:vm_service/vm_service.dart';

class UnlockdBluetoothConnectClient {
  UnlockdBluetoothConnectClient(this.vmService, this.isolateId);

  static const Duration kNormalTimeout = Duration(seconds: 4);
  static const Duration kLongTimeout = Duration(seconds: 10);

  final VmService vmService;
  final String isolateId;

  final _instancesChangedController = StreamController<void>.broadcast();

  final _adapterStateChangedController =
      StreamController<ConnectAdapterStateResponse>.broadcast();

  Stream<void> get instancesChanged => _instancesChangedController.stream;

  Stream<ConnectAdapterStateResponse> get adapterStateChanged =>
      _adapterStateChangedController.stream;

  static Future<UnlockdBluetoothConnectClient> connectVmService(
      VmService vmService) async {
    final isolateId = serviceManager.isolateManager.mainIsolate.value?.id;

    assert(isolateId != null);

    final client = UnlockdBluetoothConnectClient(vmService, isolateId!);
    final handlers = {
      UnlockdBluetoothConnectEvent.instancesChanged.event: (_) {
        client._instancesChangedController.add(null);
      },
      UnlockdBluetoothConnectEvent.adapterStateChanged.event:
          (Map<String, dynamic> json) {
        final adapterState = ConnectAdapterStateResponse.fromJson(json);
        client._adapterStateChangedController.add(adapterState);
      },
    };
    vmService.onExtensionEvent.listen((Event event) {
      final data = event.extensionData?.data ?? {};
      handlers[event.extensionKind]?.call(data);
    });

    return client;
  }

  Future<Map<String, dynamic>?> _call(
    UnlockdBluetoothConnectAction action, {
    Duration? timeout = kNormalTimeout,
    dynamic param,
  }) async {
    var responseFuture = vmService.callServiceExtension(
      action.method,
      isolateId: isolateId,
      args: {
        if (param != null) 'args': jsonEncode(param),
      },
    );
    if (timeout != null) {
      responseFuture = responseFuture.timeout(timeout);
    }

    final response = await responseFuture;
    return response.json?['result'] as Map<String, dynamic>?;
  }

  Future<BluetoothProviderInstances> listInstances() async {
    final json = await _call(UnlockdBluetoothConnectAction.listInstances);
    var listOfInstances =
        ConnectInstanceNamesResponse.fromJson(json!).instances.map((e) {
      return BluetoothProviderInstance(value: e);
    }).toList();
    return BluetoothProviderInstances(instances: listOfInstances);
  }

  Future<void> watchAdapterState() async {
    await _call(UnlockdBluetoothConnectAction.adapterState);
  }

  Future<void> turnOffAdapter() async {
    var response = await _call(UnlockdBluetoothConnectAction.turnOff);
    if (response?['message'] == "Not supported on this platform") {
      return Future.error("Not supported on this platform");
    }
  }

  Future<void> turnOnAdapter() async {
    var response = await _call(UnlockdBluetoothConnectAction.turnOn);
    if (response?['message'] == "Not supported on this platform") {
      return Future.error("Not supported on this platform");
    }
  }

  Future<List<ConnectedSystemDevice>> listSystemDevices() async {
    var json = await _call(UnlockdBluetoothConnectAction.listSystemDevices);
    var connectSystemDevicesResponse =
        ConnectSystemDevicesResponse.fromJson(json!).bluetoohDevices;
    return connectSystemDevicesResponse;
  }

  Future<void> disconnect() async {
    await vmService.dispose();
  }
}
