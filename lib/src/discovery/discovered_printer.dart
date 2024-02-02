import '../utils/regex.dart';

/// Type for [DiscoveredPrinter.address]
/// {@category Discovery}
enum AddressType {
  ipAddress,
  macAddress,
  localName;
}

/// Represents an instance of a printer found over the network
/// {@category Discovery}
final class DiscoveredPrinter {
  const DiscoveredPrinter({required this.address});

  /// IP, MAC address or local name of the device.
  final String address;

  /// Is [address] is match as IP Address
  bool get isIpAddress => ipAddressRegex.hasMatch(address);

  /// Is [address] is match as MAC Address
  bool get isMacAddress => macAddressRegex.hasMatch(address);

  /// If the [address] is the local name of the device
  bool get isLocalName => !isIpAddress && !isMacAddress;

  /// Represents a convenient type for using switch
  AddressType get type {
    if (isIpAddress) {
      return AddressType.ipAddress;
    } else if (isMacAddress) {
      return AddressType.macAddress;
    }

    return AddressType.localName;
  }
}
