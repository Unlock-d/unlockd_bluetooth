import 'dart:convert';
import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:unlockd_bluetooth/unlockd_bluetooth.dart';
import 'package:watcher/watcher.dart';

const bluetoothConfigPath = 'assets/bluetooth.json';
const bluetoothDeviceConfigPath = 'assets/bluetooth_device.json';

Stream<WatchEvent> watchConfig() => FileWatcher(bluetoothConfigPath).events;

Stream<WatchEvent> watchBluetoothDeviceConfig() =>
    FileWatcher(bluetoothDeviceConfigPath).events;

TaskEither<FileHandlingException, Json> readJsonFile(FilePath path) =>
    openFile(path)
        .chainTask(readFileContents)
        .mapLeft((l) => l)
        .map(jsonDecode)
        .map((dynamicValue) => dynamicValue as Json);

TaskEither<FileReadException, String> readFileContents(File file) =>
    TaskEither.tryCatch(
      () async => file.readAsString(),
      FileReadException.new,
    );

TaskEither<FileWriteException, File> overwriteFileContents(
  File file,
  String contents,
) =>
    TaskEither.tryCatch(
      () => file.writeAsString(contents),
      FileWriteException.new,
    );

TaskEither<FileHandlingException, File> openFile(FilePath path) =>
    TaskEither.tryCatch(
      () async => File(path),
      FileReadException.new,
    );
