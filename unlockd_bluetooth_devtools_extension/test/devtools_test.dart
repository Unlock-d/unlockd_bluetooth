import 'package:devtools_extensions/devtools_extensions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unlockd_bluetooth_devtools_extension/main.dart';

void main() {
  testWidgets('DevTools Extension loads smoke test',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const UnlockdFlutterBluePlusProviderDevToolsExtension());

    // Verify that the extension is loaded.
    expect(find.byType(DevToolsExtension), findsOneWidget);
  });
}
