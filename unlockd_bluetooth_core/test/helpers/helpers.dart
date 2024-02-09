import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:nordic_dfu/nordic_dfu.dart';

class FakeNordicDfu extends Fake implements NordicDfu {
  FakeNordicDfu({
    this.startupDelay = 0,
  });

  final int startupDelay;

  @override
  Future<String?> abortDfu() async {
    return '';
  }

  @override
  Future<String?> startDfu(
    String address,
    String filePath, {
    String? name,
    bool? fileInAsset,
    bool? forceDfu,
    int? numberOfPackets,
    bool? enableUnsafeExperimentalButtonlessServiceInSecureDfu,
    AndroidSpecialParameter androidSpecialParameter =
        const AndroidSpecialParameter(),
    IosSpecialParameter iosSpecialParameter = const IosSpecialParameter(),
    DfuCallback? onDeviceConnected,
    DfuCallback? onDeviceConnecting,
    DfuCallback? onDeviceDisconnected,
    DfuCallback? onDeviceDisconnecting,
    DfuCallback? onDfuAborted,
    DfuCallback? onDfuCompleted,
    DfuCallback? onDfuProcessStarted,
    DfuCallback? onDfuProcessStarting,
    DfuCallback? onEnablingDfuMode,
    DfuCallback? onFirmwareValidating,
    DfuErrorCallback? onError,
    DfuProgressCallback? onProgressChanged,
  }) async {
    Timer(Duration(seconds: startupDelay), () async {
      onDfuProcessStarted?.call(address);
    });
    return '';
  }
}
