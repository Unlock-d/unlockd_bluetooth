## universal_ble

onScanResult only returns actively found devices.
This means that if a device is found and then goes out of range or goes into sleep mode, there is no way to detect this.
flutter_blue_plus returns a list of devices that are actively found.
This means we can compare the two lists and see if a device is missing.