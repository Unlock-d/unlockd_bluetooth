enum UnlockdBluetoothConnectAction {
  listInstances('ext.unlockd.bluetooth.listInstances'),
  turnOn('ext.unlockd.bluetooth.turnOn'),
  turnOff('ext.unlockd.bluetooth.turnOff'),
  listSystemDevices('ext.unlockd.bluetooth.listSystemDevices'),
  adapterState('ext.unlockd.bluetooth.adapterState'),
  isScanningNow('ext.unlockd.bluetooth.isScanningNow'),
  isScanning('ext.unlockd.bluetooth.isScanning'),
  startScan('ext.unlockd.bluetooth.startScan'),
  stopScan('ext.unlockd.bluetooth.stopScan'),
  systemDevices('ext.unlockd.bluetooth.systemDevices'),
  scanResults('ext.unlockd.bluetooth.scanResults'),
  onScanResults('ext.unlockd.bluetooth.onScanResults'),
  ;

  const UnlockdBluetoothConnectAction(this.method);

  /// The method name to call.
  final String method;
}
