import 'package:devtools_app_shared/ui.dart' as devtools_shared_ui;
import 'package:flutter/material.dart';
import 'package:unlockd_bluetooth_core/unlockd_bluetooth.dart';
import 'package:unlockd_bluetooth_devtools_extension/features/connection/services/unlockd_bluetooth_connect_client.dart';

class AdapterStateView extends StatefulWidget {
  const AdapterStateView({
    super.key,
    required this.connectClient,
  });

  final UnlockdBluetoothConnectClient connectClient;

  @override
  State<AdapterStateView> createState() => _AdapterStateViewState();
}

class _AdapterStateViewState extends State<AdapterStateView> {
  @override
  void initState() {
    super.initState();
    widget.connectClient.watchAdapterState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const devtools_shared_ui.AreaPaneHeader(
          roundedTopBorder: false,
          includeTopBorder: true,
          title: Text('Adapter state'),
        ),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: StreamBuilder<ConnectAdapterStateResponse>(
            stream: widget.connectClient.adapterStateChanged,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final response = snapshot.data!;

                var state = response.state;
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Adapter state is $state',
                      style: Theme.of(context).subtleTextStyle.copyWith(
                            color: state == 'on' ? Colors.green : Colors.red,
                          ), // Shared style
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (response.state == 'on') {
                          widget.connectClient.turnOffAdapter().catchError(
                                (error) => onError(
                                  context,
                                  error,
                                ),
                              );
                        } else {
                          widget.connectClient.turnOnAdapter().catchError(
                                (error) => onError(
                                  context,
                                  error,
                                ),
                              );
                        }
                      },
                      child: const Text(
                        'Toggle adapter',
                      ),
                    ),
                  ],
                );
              }
              return Text(
                'Adapter state is unknown',
                style: Theme.of(context).subtleTextStyle, // Shared style
              );
            },
          ),
        ),
      ],
    );
  }

  void onError(
    BuildContext context,
    dynamic error,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error: $error'),
      ),
    );
  }
}
