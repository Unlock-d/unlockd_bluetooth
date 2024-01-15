import 'package:isar/isar.dart';
import 'package:unlockd_bluetooth/src/domain/domain.dart';
import 'package:unlockd_bluetooth/src/isar/isar.dart';

part 'isar_advertisement_data.g.dart';

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
