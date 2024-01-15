import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:unlockd_bluetooth/src/domain/domain.dart';

class FbpAdvertisementData extends UnlockdAdvertisementData {
  FbpAdvertisementData._(this._advertisementData);

  factory FbpAdvertisementData.fromFbp(AdvertisementData advertisementData) {
    return FbpAdvertisementData._(advertisementData);
  }

  final AdvertisementData _advertisementData;

  @override
  String get advName => _advertisementData.advName;

  @override
  bool get connectable => _advertisementData.connectable;

  @override
  Map<int, List<int>> get manufacturerData =>
      _advertisementData.manufacturerData;

  @override
  Map<String, List<int>> get serviceData => _advertisementData.serviceData
      .map((key, value) => MapEntry(key.str128, value));

  @override
  List<String> get serviceUuids =>
      _advertisementData.serviceUuids.map((e) => e.str128).toList();

  @override
  int? get txPowerLevel => _advertisementData.txPowerLevel;
}
