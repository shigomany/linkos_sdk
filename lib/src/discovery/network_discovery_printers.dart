import '../pigeons/network_discovery_printers_api.dart';
import 'discovered_printer.dart';

/// {@template src.discovery.NetworkDiscoveryPrinters}
/// A class used to discover printers on an IP Network.
/// {@endtemplate}
///
/// {@category Discovery}
final class NetworkDiscoveryPrinters {
  const NetworkDiscoveryPrinters._();

  /// {@macro src.discovery.NetworkDiscoveryPrinters}
  static NetworkDiscoveryPrinters get instance =>
      const NetworkDiscoveryPrinters._();

  /// Sends a discovery packet to the IPs specified in the [subnetRange].
  ///
  /// This method will wait up to [timeout] determining that there are
  /// no more discovery responses. Subnet searches are defined by the first three subnet octets, followed by a range, such as 192.168.2.
  ///
  /// This method accepts IP addresses of the form, assuming a subnet of 192.168.2:
  /// * __192.168.2.254__ (will send a discovery packet to 192.168.2.254)
  /// * __192.168.2.*__ (will send a discovery packet for the range 192.168.2.1 - 192.168.2.254)
  /// * __192.168.2.8-*__ (will send a discovery packet for the range 192.168.2.8 - 192.168.2.254)
  /// * __192.168.2.37-42__ (will send a discovery packet for the range 192.168.2.37 - 192.168.2.42)
  ///
  /// {@template src.discovery.timeout}
  /// *Warning!* Not recommended use timeout on [Future]:
  ///
  /// **BAD**
  /// ```dart
  /// NetworkDiscoveryPrinters.instance.subnetSearch('192.168.0.*').timeout(Duration(seconds: 3));
  /// ```
  ///
  /// **GOOD**
  /// ```dart
  /// NetworkDiscoveryPrinters.instance.subnetSearch('192.168.0.*', timeout: Duration(seconds: 3));
  /// ```
  ///
  /// Because the native call will continue to work, э
  /// despite the fact that the current future is interrupted
  /// {@endtemplate}
  Future<List<DiscoveredPrinter>> subnetSearch(
    String subnetRange, {
    Duration? timeout,
  }) async {
    final api = NetworkDiscoveryPrintersAPI();
    return api.subnetSearch(subnetRange, timeout?.inMilliseconds).then(
          (value) => value
              .where((element) => element != null)
              .map((e) => DiscoveredPrinter(address: e!))
              .toList(),
        );
  }

  /// Sends a directed broadcast discovery packet to the subnet specified by [ipAddress].
  ///
  /// This method will wait up to [timeout] determining that there are no more discovery responses.
  ///
  /// Directed broadcasts are defined by the first three subnet octets, followed by 255, such as 192.168.2.255.
  /// This method accepts IP addresses of the form, assuming a subnet of 192.168.2:
  ///
  /// * __192.168.2.255__
  /// * __192.168.2.1__ (last octet will be replaced with 255)
  /// * __192.168.2__ (will append 255 for the last octet)
  /// * __192.168.2.__ (will append 255 for the last octet)
  ///
  /// {@macro src.discovery.timeout}
  Future<List<DiscoveredPrinter>> directedBroadcast(
    String ipAddress, {
    Duration? timeout,
  }) {
    final api = NetworkDiscoveryPrintersAPI();
    return api.directedBroadcast(ipAddress, timeout?.inMilliseconds).then(
          (value) => value
              .where((element) => element != null)
              .map((e) => DiscoveredPrinter(address: e!))
              .toList(),
        );
  }

  /// Sends a local broadcast packet.
  ///
  /// This method will wait up to [timeout] determining that there are no more discovery responses.
  ///
  /// {@macro src.discovery.timeout}
  Future<List<DiscoveredPrinter>> localBroadcast({
    Duration? timeout,
  }) {
    final api = NetworkDiscoveryPrintersAPI();
    return api.localBroadcast(timeout?.inMilliseconds).then(
          (value) => value
              .where((element) => element != null)
              .map((e) => DiscoveredPrinter(address: e!))
              .toList(),
        );
  }

  /// Sends a multicast discovery packet.
  ///
  /// This method will wait up to [timeout] determining that there are no more discovery responses.
  ///
  /// {@macro src.discovery.timeout}
  Future<List<DiscoveredPrinter>> multicast(
    int hops, {
    Duration? timeout,
  }) {
    assert(hops >= 0, 'Number of hops should be non negative');
    final api = NetworkDiscoveryPrintersAPI();
    return api.multicast(hops, timeout?.inMilliseconds).then(
          (value) => value
              .where((element) => element != null)
              .map((e) => DiscoveredPrinter(address: e!))
              .toList(),
        );
  }

  /// This method will search the network using a combination of discovery methods to find printers on the network.
  ///
  /// This is a convenience method that can be used as an alternative to the other discovery methods (e.g. multicast)
  ///
  /// This method will wait up to [timeout] determining that there are no more discovery responses.
  ///
  /// [printersToFind] - A list of IP addresses or DNS names for the printers to be discovered.
  ///
  /// {@macro src.discovery.timeout}
  Future<List<DiscoveredPrinter>> findPrinters({
    List<String>? printersToFind,
    Duration? timeout,
  }) {
    final api = NetworkDiscoveryPrintersAPI();
    return api.findPrinters(printersToFind, timeout?.inMilliseconds).then(
          (value) => value
              .where((element) => element != null)
              .map((e) => DiscoveredPrinter(address: e!))
              .toList(),
        );
  }
}
