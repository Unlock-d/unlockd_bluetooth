part of 'domain.dart';

// ignore_for_file: constant_identifier_names, public_member_api_docs

enum NordicGuidEnum {
  DEVICE_INFO_SERVICE('180a', NORDIC_MASK),
  BATTERY_SERVICE('180f', NORDIC_MASK),
  BUTTONLESS_DFU_SERVICE('fe59', NORDIC_MASK),

  // DEVICE_INFO_SERVICE characteristics
  MANUFACTURER_NAME_CHAR('2a29', NORDIC_MASK),
  MODEL_NUMBER_CHAR('2a24', NORDIC_MASK),
  SERIAL_NUMBER_CHAR('2a25', NORDIC_MASK),
  HARDWARE_REVISION_CHAR('2a27', NORDIC_MASK),
  FIRMWARE_REVISION_CHAR('2a26', NORDIC_MASK),
  SOFTWARE_REVISION_CHAR('2a28', NORDIC_MASK),

  // BATTERY_SERVICE characteristics
  BATTERY_LEVEL_CHAR('2a19', NORDIC_MASK),
  ;

  const NordicGuidEnum(
    this._value,
    this._mask,
  );

  static const SPECIAL_NORDIC_MASK = '0000xxxx-1212-efde-1523-785feabcd123';
  static const NORDIC_MASK = '0000xxxx-0000-1000-8000-00805f9b34fb';

  final String _value;
  final String _mask;

  UnlockdGuid get value => maskedValue;

  UnlockdGuid get maskedValue =>
      UnlockdGuid.fromString(_mask.replaceAll('x' * _value.length, _value));
}
