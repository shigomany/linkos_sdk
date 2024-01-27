sealed class PrinterConnection {
  const factory PrinterConnection.tcpIp({required String ipAddress}) =
      TcpIpConnection;

  const PrinterConnection._();
}

final class TcpIpConnection extends PrinterConnection {
  final String ipAddress;

  const TcpIpConnection({
    required this.ipAddress,
  }) : super._();
}
