part of 'domain.dart';

// ignore_for_file: constant_identifier_names, public_member_api_docs

enum NordicGuidEnum {
  DEVICE_INFO_SERVICE('180a', NORDIC_MASK),
  BATTERY_SERVICE('180f', NORDIC_MASK),
  BUTTONLESS_DFU_SERVICE('fe59', NORDIC_MASK),

  /// The Bluetooth® Low Energy (LE) GATT Nordic UART Service is a custom
  /// service that receives and writes data and serves as a bridge to the
  /// UART interface.
  NORDIC_UART_SERVICE('1', NORDIC_UART_SERVICE_MASK),

  // DEVICE_INFO_SERVICE characteristics
  MANUFACTURER_NAME_CHAR('2a29', NORDIC_MASK),
  MODEL_NUMBER_CHAR('2a24', NORDIC_MASK),
  SERIAL_NUMBER_CHAR('2a25', NORDIC_MASK),
  HARDWARE_REVISION_CHAR('2a27', NORDIC_MASK),
  FIRMWARE_REVISION_CHAR('2a26', NORDIC_MASK),
  SOFTWARE_REVISION_CHAR('2a28', NORDIC_MASK),

  // BATTERY_SERVICE characteristics
  BATTERY_LEVEL_CHAR('2a19', NORDIC_MASK),

  // NORDIC_UART_SERVICE characteristics
  NORDIC_UART_RX_CHAR('2', NORDIC_UART_SERVICE_MASK),
  NORDIC_UART_TX_CHAR('3', NORDIC_UART_SERVICE_MASK),
  ;

  const NordicGuidEnum(
    this._value,
    this._mask,
  );

  static const NORDIC_UART_SERVICE_MASK =
      '6e40000x-b5a3-f393-e0a9-e50e24dcca9e';
  static const SPECIAL_NORDIC_MASK = '0000xxxx-1212-efde-1523-785feabcd123';
  static const NORDIC_MASK = '0000xxxx-0000-1000-8000-00805f9b34fb';

  final String _value;
  final String _mask;

  UnlockdGuid get value => maskedValue;

  UnlockdGuid get maskedValue =>
      UnlockdGuid.fromString(_mask.replaceAll('x' * _value.length, _value));
}
