# Setup instructions

https://github.com/flutter/devtools/tree/master/packages/devtools_extensions

## Trying to copy the app to

Stacktrace from running `dart run devtools_extensions build_and_copy`

```sh
[build_and_copy] Building the extension Flutter web app...

Compiling lib/main.dart for the Web...                          
Target dart2js failed: ProcessException: Process exited abnormally:
../../../../.pub-cache/hosted/pub.dev/devtools_app_shared-0.0.6/lib/src/service/service_extensions.dart:221:59:
Error: Member not found: 'profilePlatformChannels'.
      '$flutterExtensionPrefix${ServicesServiceExtensions.profilePlatformChannels.name}',
                                                          ^^^^^^^^^^^^^^^^^^^^^^^
../../../../.pub-cache/hosted/pub.dev/devtools_shared-4.2.0/lib/src/service/service.dart:35:14:
Warning: Operand of null-aware operation '!' has type 'Stream<String>' which excludes null.
 - 'Stream' is from 'dart:async'.
      client.stream!.asBroadcastStream() as Stream<String>;
             ^
../../../../.pub-cache/hosted/pub.dev/devtools_shared-4.2.0/lib/src/service/service.dart:38:26:
Warning: Operand of null-aware operation '!' has type 'StreamSink<String>' which excludes null.
 - 'StreamSink' is from 'dart:async'.
    writeMessage: client.sink!.add,
                         ^
../../../../.pub-cache/hosted/pub.dev/devtools_shared-4.2.0/lib/src/service/service.dart:43:12:
Warning: Operand of null-aware operation '!' has type 'StreamSink<String>' which excludes null.
 - 'StreamSink' is from 'dart:async'.
    client.sink!.done.whenComplete(() {
           ^
Error: Compilation failed.
  Command: /opt/flutter/bin/cache/dart-sdk/bin/dart --disable-dart-dev /opt/flutter/bin/cache/dart-sdk/bin/snapshots/dart2js.dart.snapshot --platform-binaries=/opt/flutter/bin/cache/flutter_web_sdk/kernel --invoker=flutter_tool -Ddart.vm.product=true -DFLUTTER_WEB_AUTO_DETECT=false -DFLUTTER_WEB_USE_SKIA=true -DFLUTTER_WEB_CANVASKIT_URL=https://www.gstatic.com/flutter-canvaskit/f40e976bedff57e69e1b3d89a7c2a3c617a03dad/ --native-null-assertions --no-source-maps -o /home/robrepi/Projects/unlockd/unlockd_bluetooth/unlockd_bluetooth_devtools_extension/.dart_tool/flutter_build/9081213d5d378189e6d1bb04c22d1430/app.dill --packages=.dart_tool/package_config.json --cfe-only /home/robrepi/Projects/unlockd/unlockd_bluetooth/unlockd_bluetooth_devtools_extension/.dart_tool/flutter_build/9081213d5d378189e6d1bb04c22d1430/main.dart
#0      RunResult.throwException (package:flutter_tools/src/base/process.dart:127:5)
#1      _DefaultProcessUtils.run (package:flutter_tools/src/base/process.dart:280:19)
<asynchronous suspension>
#2      Dart2JSTarget.build (package:flutter_tools/src/build_system/targets/web.dart:189:5)
<asynchronous suspension>
#3      _BuildInstance._invokeInternal (package:flutter_tools/src/build_system/build_system.dart:853:9)
<asynchronous suspension>
#4      Future.wait.<anonymous closure> (dart:async/future.dart:523:21)
<asynchronous suspension>
#5      _BuildInstance.invokeTarget (package:flutter_tools/src/build_system/build_system.dart:791:32)
<asynchronous suspension>
#6      Future.wait.<anonymous closure> (dart:async/future.dart:523:21)
<asynchronous suspension>
#7      _BuildInstance.invokeTarget (package:flutter_tools/src/build_system/build_system.dart:791:32)
<asynchronous suspension>
#8      FlutterBuildSystem.build (package:flutter_tools/src/build_system/build_system.dart:620:16)
<asynchronous suspension>
#9      WebBuilder.buildWeb (package:flutter_tools/src/web/compile.dart:89:34)
<asynchronous suspension>
#10     BuildWebCommand.runCommand (package:flutter_tools/src/commands/build_web.dart:199:5)
<asynchronous suspension>
#11     FlutterCommand.run.<anonymous closure> (package:flutter_tools/src/runner/flutter_command.dart:1367:27)
<asynchronous suspension>
#12     AppContext.run.<anonymous closure> (package:flutter_tools/src/base/context.dart:150:19)
<asynchronous suspension>
#13     CommandRunner.runCommand (package:args/command_runner.dart:212:13)
<asynchronous suspension>
#14     FlutterCommandRunner.runCommand.<anonymous closure> (package:flutter_tools/src/runner/flutter_command_runner.dart:348:9)
<asynchronous suspension>
#15     AppContext.run.<anonymous closure> (package:flutter_tools/src/base/context.dart:150:19)
<asynchronous suspension>
#16     FlutterCommandRunner.runCommand (package:flutter_tools/src/runner/flutter_command_runner.dart:294:5)
<asynchronous suspension>
#17     run.<anonymous closure>.<anonymous closure> (package:flutter_tools/runner.dart:112:9)
<asynchronous suspension>
#18     AppContext.run.<anonymous closure> (package:flutter_tools/src/base/context.dart:150:19)
<asynchronous suspension>
#19     main (package:flutter_tools/executable.dart:90:3)
<asynchronous suspension>

Compiling lib/main.dart for the Web...                              6.8s
Exception: Failed to compile application for the Web.
Unhandled exception:
ProcessException: Failed with exit code: 1
  Command: flutter build web --web-renderer canvaskit --pwa-strategy=offline-first --release --no-tree-shake-icons
#0      BuildExtensionCommand._runProcess (file:///home/robrepi/.pub-cache/hosted/pub.dev/devtools_extensions-0.0.9/bin/_build_and_copy.dart:133:7)
<asynchronous suspension>
#1      BuildExtensionCommand.run (file:///home/robrepi/.pub-cache/hosted/pub.dev/devtools_extensions-0.0.9/bin/_build_and_copy.dart:57:5)
<asynchronous suspension>
#2      CommandRunner.runCommand (package:args/command_runner.dart:212:13)
<asynchronous suspension>
#3      main (file:///home/robrepi/.pub-cache/hosted/pub.dev/devtools_extensions-0.0.9/bin/devtools_extensions.dart:12:3)
<asynchronous suspension>
```

## Trying to run the app

```sh
Launching lib/main.dart on Chrome in debug mode...
Waiting for connection from debug service on Chrome...          
../../../../.pub-cache/hosted/pub.dev/devtools_app_shared-0.0.6/lib/src/service/service_extensions.dart:221:59: Error: Member not found: 'profilePlatformChannels'.
      '$flutterExtensionPrefix${ServicesServiceExtensions.profilePlatformChannels.name}',
                                                          ^^^^^^^^^^^^^^^^^^^^^^^
Waiting for connection from debug service on Chrome...             15.2s
Failed to compile application.
```

The package isn't up-to-date and even fails for static analysis (https://pub.dev/packages/devtools_app_shared/)

## Running the application

1. Use the Simulated DevTools Environment (recommended for development)
    ```sh
    # From within the unlockd_bluetooth_devtools_extension directory
    flutter run -d chrome --dart-define=use_simulated_environment=true
    # Start another Flutter app
    # Link the DevTools extension to the running app from within the DevTools UI
    ```

2. Use a real DevTools Environment
   ```sh
   cd unlockd_bluetooth_devtools_extension;
   flutter pub get;
   dart run devtools_extensions build_and_copy --source=. --dest=../unlockd_bluetooth_core/extension/devtools
   # Start another Flutter app that uses unlockd_bluetooth_core
   ```