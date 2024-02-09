part of 'isar.dart';

@Embedded(inheritance: false)
class IsarAdvertisementData extends UnlockdAdvertisementData {
  @override
  String advName = '';

  @override
  bool connectable = false;

  List<IsarManufacturerData> isarManufacturerData = [];

  List<IsarServiceData> isarServiceData = [];

  @override
  List<String> serviceUuids = [];

  @override
  int? txPowerLevel;

  @ignore
  @override
  Map<int, List<int>> get manufacturerData =>
      {for (final e in isarManufacturerData) e.manufacturerId: e.value};

  @ignore
  @override
  Map<String, List<int>> get serviceData =>
      {for (final e in isarServiceData) e.serviceGuid: e.value};
}
