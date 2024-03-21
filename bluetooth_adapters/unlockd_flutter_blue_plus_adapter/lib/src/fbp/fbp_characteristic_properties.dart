import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:unlockd_bluetooth_core/unlockd_bluetooth.dart';

class FbpCharacteristicProperties extends UnlockdCharacteristicProperties {
  FbpCharacteristicProperties._(this._properties);

  factory FbpCharacteristicProperties.fromFbp(
    CharacteristicProperties properties,
  ) {
    return FbpCharacteristicProperties._(properties);
  }

  CharacteristicProperties _properties;

  @override
  bool get writeWithoutResponse => _properties.writeWithoutResponse;

  @override
  bool get read => _properties.read;

  @override
  bool get authenticatedSignedWrites => _properties.authenticatedSignedWrites;

  @override
  bool get broadcast => _properties.broadcast;

  @override
  bool get extendedProperties => _properties.extendedProperties;

  @override
  bool get indicate => _properties.indicate;

  @override
  bool get indicateEncryptionRequired => _properties.indicateEncryptionRequired;

  @override
  bool get notify => _properties.notify;

  @override
  bool get notifyEncryptionRequired => _properties.notifyEncryptionRequired;

  @override
  bool get write => _properties.write;
}
