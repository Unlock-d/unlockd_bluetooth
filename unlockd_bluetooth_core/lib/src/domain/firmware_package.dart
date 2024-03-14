part of 'domain.dart';

/// Class representing a firmware package.
sealed class FirmwarePackage {
  FirmwarePackage(this.path);

  final Logger _logger = Logger('$LocalFirmwarePackage');

  /// Path to the firmware package.
  final String path;

  /// Returns the size of the firmware package.
  int getFileSize() {
    try {
      return File(path).lengthSync();
    } catch (e, st) {
      _logger.warning('Unable to determine file size for [$path]', e, st);
      return 0;
    }
  }
}

/// A firmware package from the local file system.
class LocalFirmwarePackage extends FirmwarePackage {
  /// Creates a firmware package from the local file system
  /// with the given [path].
  LocalFirmwarePackage(super.path);
}

/// A firmware package from an external source.
class ExternalFirmwarePackage extends FirmwarePackage {
  /// Creates a firmware package from an external source with the given [path].
  ExternalFirmwarePackage(super.path);
}

/// A fake firmware package for testing purposes.
class FakeFirmwarePackage extends FirmwarePackage {
  /// Creates a fake firmware package with the given [path] and [_fileSize].
  FakeFirmwarePackage(
    super.path,
    this._fileSize,
  );

  final int _fileSize;

  @override
  int getFileSize() {
    return _fileSize;
  }
}
