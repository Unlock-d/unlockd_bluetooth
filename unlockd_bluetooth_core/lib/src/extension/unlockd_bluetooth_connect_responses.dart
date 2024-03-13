/// The response for [UnlockdBluetoothConnectEvent.instancesChanged].
class ConnectInstanceNamesResponse {
  /// Creates a new [ConnectInstanceNamesResponse].
  ConnectInstanceNamesResponse(this.instances);

  /// Creates a new [ConnectInstanceNamesResponse] from a JSON map.
  factory ConnectInstanceNamesResponse.fromJson(Map<String, dynamic> json) {
    return ConnectInstanceNamesResponse(
      (json['instances'] as List).cast<String>(),
    );
  }

  /// The list of instance names.
  final List<String> instances;

  /// Converts this response to a JSON map.
  Map<String, dynamic> toJson() {
    return {'instances': instances};
  }
}

/// The response for [ConnectAction.turnOn].
abstract class TurnOnAdapterResponse {}

/// A successful response for [ConnectAction.turnOn].
class SuccessTurnOnAdapterResponse implements TurnOnAdapterResponse {
  /// Creates a new [SuccessTurnOnAdapterResponse].
  SuccessTurnOnAdapterResponse();

  /// Converts this payload to a JSON map.
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An error response for [ConnectAction.turnOn].
class ErrorTurnOnAdapterResponse implements TurnOnAdapterResponse {
  /// Creates a new [ErrorTurnOnAdapterResponse].
  ErrorTurnOnAdapterResponse({required this.message});

  /// The error message.
  final String message;

  /// Converts this payload to a JSON map.
  Map<String, dynamic> toJson() {
    return {'message': message};
  }
}

/// The response for [ConnectAction.turnOff].
abstract class TurnOffAdapterResponse {}

/// A successful response for [ConnectAction.turnOff].
class SuccessTurnOffAdapterResponse implements TurnOffAdapterResponse {
  /// Creates a new [SuccessTurnOffAdapterResponse].
  SuccessTurnOffAdapterResponse();

  /// Converts this payload to a JSON map.
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An error response for [ConnectAction.turnOff].
class ErrorTurnOffAdapterResponse implements TurnOffAdapterResponse {
  /// Creates a new [ErrorTurnOffAdapterResponse].
  ErrorTurnOffAdapterResponse({required this.message});

  /// The error message.
  final String message;

  /// Converts this payload to a JSON map.
  Map<String, dynamic> toJson() {
    return {'message': message};
  }
}

/// The response for [ConnectAction.listSystemDevices].
class ConnectSystemDevicesResponse {
  /// Creates a new [ConnectSystemDevicesResponse].
  ConnectSystemDevicesResponse(this.bluetoohDevices);

  /// Creates a new [ConnectSystemDevicesResponse].
  factory ConnectSystemDevicesResponse.fromJson(Map<String, dynamic> json) {
    return ConnectSystemDevicesResponse(
      (json['bluetoohDevices'] as List)
          .map((e) => ConnectedSystemDevice.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  /// The list of system devices.
  final List<ConnectedSystemDevice> bluetoohDevices;

  /// Converts this payload to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'bluetoohDevices': bluetoohDevices.map((e) => e.toJson()).toList(),
    };
  }
}

/// A s  ystem device.
class ConnectedSystemDevice {
  /// Creates a new [ConnectedSystemDevice].
  ConnectedSystemDevice({
    required this.identifier,
    required this.name,
    required this.isConnected,
  });

  /// Creates a new [ConnectedSystemDevice].
  factory ConnectedSystemDevice.fromJson(Map<String, dynamic> json) {
    return ConnectedSystemDevice(
      identifier: json['identifier'] as String,
      name: json['name'] as String,
      isConnected: json['isConnected'] as bool,
    );
  }

  /// The identifier of the device.
  final String identifier;

  /// The name of the device.
  final String name;

  /// Whether the device is connected.
  final bool isConnected;

  /// Converts this payload to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'identifier': identifier,
      'name': name,
      'isConnected': isConnected,
    };
  }
}

/// The response for [UnlockdBluetoothConnectEvent.adapterStateChanged].
class ConnectAdapterStateResponse {
  /// Creates a new [ConnectAdapterStateResponse].
  ConnectAdapterStateResponse(this.state);

  /// Creates a new [ConnectAdapterStateResponse] from a JSON map.
  factory ConnectAdapterStateResponse.fromJson(Map<String, dynamic> json) {
    return ConnectAdapterStateResponse(
      json['state'] as String,
    );
  }

  /// the state of the adapter.
  final String state;

  /// Converts this payload to a JSON map.
  Map<String, dynamic> toJson() {
    return {'state': state};
  }
}
