import 'package:devtools_app_shared/ui.dart' as devtools_shared_ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unlockd_bluetooth_core/unlockd_bluetooth.dart';

class SystemDevicesView extends StatelessWidget {
  const SystemDevicesView({
    super.key,
    required this.connectedSystemDevices,
  });

  final List<ConnectedSystemDevice> connectedSystemDevices;

  @override
  Widget build(BuildContext context) {
    return devtools_shared_ui.RoundedOutlinedBorder(
      child: Column(
        children: [
          const devtools_shared_ui.AreaPaneHeader(
            roundedTopBorder: true,
            includeTopBorder: true,
            title: Text('System devices'),
          ),
          Flexible(
            child: ListView.builder(
              itemBuilder: (context, index) => Text(
                connectedSystemDevices[index].name,
              ),
              itemCount: connectedSystemDevices.length,
            ),
          ),
        ],
      ),
    );
  }
}
