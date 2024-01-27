import 'printer_connection.dart';
// import 'zebra_printer.dart';
import 'pigeons/pigeons.dart' as pigeons;

final class ZebraFactory {
  static Future<pigeons.ZebraPrinter> connectToPrinter(
      PrinterConnection connection) async {
    final pigeonFactory = pigeons.ZebraFactory();
    return switch (connection) {
      TcpIpConnection(ipAddress: final address) =>
        await pigeonFactory.connectToPrinterViaTcpIp(
          pigeons.TcpIpConnection(ipAddress: address),
        ),
    };
  }
}
