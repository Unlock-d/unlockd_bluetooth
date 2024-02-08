part of 'domain.dart';

sealed class FirmwarePackage {
  FirmwarePackage(this.filePath);

  final String filePath;
  final Logger _logger = Logger('$LocalFirmwarePackage');

  String getPath() {
    return filePath;
  }

  int getFileSize() {
    final path = getPath();

    try {
      return File(path).lengthSync();
    } catch (e, st) {
      _logger.warning('Unable to determine file size for [$path]', e, st);
      return 0;
    }
  }
}

class LocalFirmwarePackage extends FirmwarePackage {
  LocalFirmwarePackage(super.filePath);
}

class ExternalFirmwarePackage extends FirmwarePackage {
  ExternalFirmwarePackage(super.filePath);
}

class FakeFirmwarePackage extends FirmwarePackage {
  FakeFirmwarePackage(
    super.filePath,
    this.fileSize,
  );

  final int fileSize;

  String getPath() {
    return filePath;
  }

  int getFileSize() {
    return fileSize;
  }
}
