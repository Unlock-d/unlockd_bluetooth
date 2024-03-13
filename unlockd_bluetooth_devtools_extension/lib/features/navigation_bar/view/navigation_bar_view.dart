import 'package:devtools_extensions/devtools_extensions.dart';
import 'package:flutter/material.dart';
import 'package:devtools_app_shared/ui.dart' as devtools_shared_ui;
import 'package:unlockd_bluetooth_devtools_extension/features/connection/model/instances.dart';
import 'package:unlockd_bluetooth_devtools_extension/features/connection/services/unlockd_bluetooth_connect_client.dart';
import 'package:unlockd_bluetooth_devtools_extension/features/connection/view/connection_view.dart';
import 'package:unlockd_bluetooth_devtools_extension/features/navigation_bar/model/model.dart';
import 'package:provider/provider.dart';

class NavigationBarView extends StatefulWidget {
  const NavigationBarView({
    super.key,
    required this.items,
  });

  final List<NavigationBarItem> items;

  @override
  State<NavigationBarView> createState() => _NavigationBarViewState();
}

class _NavigationBarViewState extends State<NavigationBarView> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return devtools_shared_ui.RoundedOutlinedBorder(
      child: DefaultTabController(
        length: widget.items.length,
        child: ValueListenableBuilder(
          valueListenable: serviceManager.connectedState,
          builder: (context, value, child) {
            if (value.connected) {
              return ConnectionView(
                vmService: serviceManager.service!,
                content: buildLoadedScaffold,
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Scaffold buildLoadedScaffold({
    required UnlockdBluetoothConnectClient client,
    required BluetoothProviderInstances instances,
  }) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: widget.items.map((item) => item.header).toList(),
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      body: MultiProvider(
        providers: [
          Provider<UnlockdBluetoothConnectClient>(
            create: (_) => client,
          ),
          Provider<BluetoothProviderInstances>(
            create: (_) => instances,
          ),
        ],
        child: Center(
          child: widget.items.elementAt(_selectedIndex).content,
        ),
      ),
    );
  }
}
