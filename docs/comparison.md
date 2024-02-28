## universal_ble

onScanResult only returns actively found devices.
This means that if a device is found and then goes out of range or goes into sleep mode, there is no way to detect this.
flutter_blue_plus returns a list of devices that are actively found.
This means we can compare the two lists and see if a device is missing.

We're only able to listen to one characteristic across all devices.
This needs to be verified though. 
It's possible that we are able to listen to multiple chars but we need to maintain the different streams ourselves.
