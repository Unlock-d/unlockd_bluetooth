import 'dart:async';

import 'package:flutter/material.dart';
import 'package:unlockd_bluetooth_devtools_extension/features/connection/model/instances.dart';
import 'package:unlockd_bluetooth_devtools_extension/features/connection/services/connect_client.dart';
import 'package:unlockd_bluetooth_devtools_extension/features/connection/widgets/error_screen.dart';
import 'package:vm_service/vm_service.dart';

class ConnectionView extends StatefulWidget {
  const ConnectionView({
    super.key,
    required this.vmService,
    required this.content,
  });

  final VmService vmService;
  final Widget Function(
      {required ConnectClient client,
      required BluetoothProviderInstances instances}) content;

  @override
  State<ConnectionView> createState() => _ConnectionPageState();
}

class _ConnectionPageState extends State<ConnectionView> {
  late Future<ConnectClient> clientFuture;

  @override
  void initState() {
    clientFuture = ConnectClient.connectVmService(widget.vmService);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ConnectionView oldWidget) {
    if (oldWidget.vmService != widget.vmService) {
      clientFuture = ConnectClient.connectVmService(widget.vmService);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ConnectClient>(
      future: clientFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _InstancesLoader(
            client: snapshot.data!,
            content: widget.content,
          );
        } else if (snapshot.hasError) {
          return const ErrorScreen();
        } else {
          return const Loading();
        }
      },
    );
  }
}

class _InstancesLoader extends StatefulWidget {
  const _InstancesLoader({
    required this.client,
    required this.content,
  });

  final ConnectClient client;
  final Widget Function(
      {required ConnectClient client,
      required BluetoothProviderInstances instances}) content;

  @override
  State<_InstancesLoader> createState() => _InstancesLoaderState();
}

class _InstancesLoaderState extends State<_InstancesLoader> {
  late Future<BluetoothProviderInstances> instancesFuture;
  late StreamSubscription<void> _instancesSubscription;

  @override
  void initState() {
    instancesFuture = widget.client.listInstances();
    _instancesSubscription = widget.client.instancesChanged.listen((event) {
      setState(() {
        instancesFuture = widget.client.listInstances();
      });
    });

    super.initState();
  }

  @override
  void didUpdateWidget(covariant _InstancesLoader oldWidget) {
    instancesFuture = widget.client.listInstances();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _instancesSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<BluetoothProviderInstances>(
      future: instancesFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return widget.content.call(
            client: widget.client,
            instances: snapshot.data!,
          );
        } else if (snapshot.hasError) {
          return const ErrorScreen();
        } else {
          return const Loading();
        }
      },
    );
  }
}

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
