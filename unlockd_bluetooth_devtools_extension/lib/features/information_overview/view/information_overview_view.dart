import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unlockd_bluetooth_devtools_extension/features/adapter_state/adapter_state.dart';
import 'package:unlockd_bluetooth_devtools_extension/features/connection/model/instances.dart';
import 'package:unlockd_bluetooth_devtools_extension/features/connection/services/unlockd_bluetooth_connect_client.dart';
import 'package:unlockd_bluetooth_devtools_extension/features/instances/view/instances_view.dart';

class InformationOverviewView extends StatelessWidget {
  const InformationOverviewView({super.key});

  @override
  Widget build(BuildContext context) {
    final bluetoothProviderInstances =
        context.watch<BluetoothProviderInstances>();

    final connectClient = context.watch<UnlockdBluetoothConnectClient>();

    return Column(
      children: [
        InstancesView(
          bluetoothProviderInstances: bluetoothProviderInstances,
        ),
        AdapterStateView(
          connectClient: connectClient,
        ),
      ],
    );
  }
}
