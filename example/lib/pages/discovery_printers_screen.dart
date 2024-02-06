import 'package:flutter/material.dart';
import 'package:linkos_sdk/linkos_sdk.dart';

class DiscoveryPrintersScreen extends StatefulWidget {
  const DiscoveryPrintersScreen({
    required this.onSelectPrinter,
    super.key,
  });

  final ValueChanged<DiscoveredPrinter> onSelectPrinter;

  @override
  State<DiscoveryPrintersScreen> createState() =>
      _DiscoveryPrintersScreenState();
}

class _DiscoveryPrintersScreenState extends State<DiscoveryPrintersScreen> {
  late final Future<List<DiscoveredPrinter>> _future;

  static const _subnetRange = '10.0.132.*';

  @override
  void initState() {
    super.initState();
    _future = NetworkDiscoveryPrinters.instance.subnetSearch(_subnetRange);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discovery Printer'),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(30),
          child: Text('Subnet: $_subnetRange'),
        ),
      ),
      body: FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error!}'),
            );
          }

          return Center(
            child: ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final item = snapshot.data![index];
                return InkWell(
                  onTap: () => _handleSelectPrinter(item),
                  borderRadius: BorderRadius.circular(8),
                  child: Card(
                    margin: const EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Tooltip(
                                message:
                                    'Connection: ${_connectionType(item.type)}',
                                child: Icon(
                                  switch (item.type) {
                                    AddressType.ipAddress => Icons.wifi,
                                    AddressType.macAddress => Icons.bluetooth,
                                    AddressType.localName => Icons.home,
                                  },
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Address: ${item.address}',
                                style: Theme.of(context).textTheme.labelLarge,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  String _connectionType(AddressType type) {
    return switch (type) {
      AddressType.ipAddress => 'WiFi',
      AddressType.macAddress => 'Bluetooth',
      AddressType.localName => 'USB',
    };
  }

  void _handleSelectPrinter(DiscoveredPrinter printer) {
    widget.onSelectPrinter(printer);
    Navigator.of(context).pop();
  }
}
