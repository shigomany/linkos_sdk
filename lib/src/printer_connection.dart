import 'utils/regex.dart';

/// Represents two types connection:
///
/// * Bluetooth [BluetoothConnection] - in future
/// * TCP/IP [TcpIpConnection]
sealed class PrinterConnection {
  /// TCP/IP connection type.
  ///
  /// If the [port] is not specified, then the default ZPL port.
  factory PrinterConnection.tcpIp({
    required String ipAddress,
    int? port,
  }) = TcpIpConnection;

  // const factory PrinterConnection.bluetooth({required String macAddress}) =
  //     BluetoothConnection;

  const PrinterConnection._();
}

final class TcpIpConnection extends PrinterConnection {
  final String ipAddress;

  final int? port;

  TcpIpConnection({
    required this.ipAddress,
    this.port,
  })  : assert(port == null || port >= 0, 'Port should not be negative'),
        assert(
          ipAddressRegex.hasMatch(ipAddress),
          'Invalid ip format',
        ),
        super._();
}

final class BluetoothConnection extends PrinterConnection {
  final String macAddress;

  const BluetoothConnection({
    required this.macAddress,
  }) : super._();
}
