enum UnlockdBluetoothConnectEvent {
  instancesChanged('unlockd.bluetooth.instancesChanged'),
  adapterStateChanged('unlockd.bluetooth.adapterStateChanged'),
  //queryChanged('isar.queryChanged'),
  //collectionInfoChanged('isar.collectionInfoChanged'),
  ;

  const UnlockdBluetoothConnectEvent(this.event);

  /// The event name to listen for.
  final String event;
}
