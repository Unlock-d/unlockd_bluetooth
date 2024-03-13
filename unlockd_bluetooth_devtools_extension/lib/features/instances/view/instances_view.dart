import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:devtools_app_shared/ui.dart' as devtools_shared_ui;
import 'package:flutter/widgets.dart';
import 'package:unlockd_bluetooth_devtools_extension/features/connection/model/instances.dart';

class InstancesView extends StatelessWidget {
  const InstancesView({
    super.key,
    required this.bluetoothProviderInstances,
  });

  final BluetoothProviderInstances bluetoothProviderInstances;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const devtools_shared_ui.AreaPaneHeader(
          roundedTopBorder: true,
          includeTopBorder: true,
          title: Text('Instances'),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: 50,
          ),
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(
              25,
            ),
            children: [
              Text(
                instances(context),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String instances(BuildContext context) {
    return bluetoothProviderInstances.instances.map((e) => e.value).join(', ');
  }
}
