import 'package:flutter/material.dart';
import 'package:devtools_app_shared/ui.dart' as devtools_shared_ui;
import 'package:unlockd_bluetooth_devtools_extension/features/connection/model/instances.dart';

class InstancesView extends StatelessWidget {
  const InstancesView({
    super.key,
    required this.bluetoothProviderInstances,
  });

  final BluetoothProviderInstances bluetoothProviderInstances;

  @override
  Widget build(BuildContext context) {
    return devtools_shared_ui.RoundedOutlinedBorder(
      child: Column(
        children: [
          const devtools_shared_ui.AreaPaneHeader(
            roundedTopBorder: true,
            includeTopBorder: true,
            title: Text('Instances'),
          ),
          Text(
            instances(context),
          ),
        ],
      ),
    );
  }

  String instances(BuildContext context) {
    return bluetoothProviderInstances.instances.map((e) => e.value).join(', ');
  }
}
