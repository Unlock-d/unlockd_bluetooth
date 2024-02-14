part of 'domain.dart';

abstract class UnlockdAdvertisementData {
  String get advName;

  int? get txPowerLevel;

  bool get connectable;

  Map<int, List<int>> get manufacturerData;

  Map<UnlockdGuid, List<int>> get serviceData;

  List<String> get serviceUuids;
}
