// ignore_for_file: public_member_api_docs

import 'package:unlockd_bluetooth_core/unlockd_bluetooth.dart';
import 'package:unlockd_fake_provider/unlockd_fake_provider.dart';

/// An object mother is a kind of class used in testing to help create
/// example objects that you use for testing.
/// See https://martinfowler.com/bliki/ObjectMother.html for more information.

UnlockdScanResult scanResult({
  UnlockdBluetoothDevice? device,
  int rssi = -50,
}) {
  return FakeScanResult(
    device: device ?? bluetoothDevice(),
    rssi: rssi,
    advertisementData: FakeAdvertisementData(
      advName: 'TRP Controller',
      txPowerLevel: 0,
      connectable: true,
      manufacturerData: {},
      serviceData: {},
      serviceUuids: [],
    ),
  );
}

UnlockdBluetoothDevice bluetoothDevice({
  String? remoteId,
  String? platformName,
}) {
  return FakeBluetoothDevice(
    remoteId: remoteId ?? 'fake_remote_id',
    platformName: platformName ?? 'fake_adv_name',
  );
}

FirmwarePackage firmwarePackage() {
  return FakeFirmwarePackage('filePath', 1);
}
