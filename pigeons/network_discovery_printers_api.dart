import 'package:pigeon/pigeon.dart';

@HostApi()

/// {@nodoc}
abstract class NetworkDiscoveryPrintersAPI {
  List<String> subnetSearch(String subnetRange, int? waitForResponsesTimeout);

  List<String> directedBroadcast(
    String ipAddress,
    int? waitForResponsesTimeout,
  );

  List<String> localBroadcast(int? waitForResponsesTimeout);

  List<String> multicast(int hops, int? waitForResponsesTimeout);

  List<String> findPrinters(
    List<String>? printersToFind,
    int? waitForResponsesTimeout,
  );
}
