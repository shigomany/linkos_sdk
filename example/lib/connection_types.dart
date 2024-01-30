import 'package:flutter/material.dart';

final class ConnectionTypes extends StatefulWidget {
  const ConnectionTypes({
    this.connectionTypeController,
    this.ipController,
    this.macAddressController,
    super.key,
  });

  final TabController? connectionTypeController;
  final TextEditingController? ipController;
  final TextEditingController? macAddressController;

  @override
  State<ConnectionTypes> createState() => _ConnectionTypesState();
}

class _ConnectionTypesState extends State<ConnectionTypes>
    with SingleTickerProviderStateMixin {
  late final TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = widget.connectionTypeController ??
        TabController(
          length: 2,
          vsync: this,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).highlightColor,
      ),
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(
                text: 'Network',
                icon: Icon(Icons.wifi),
              ),
              Tab(
                text: 'Bluetooth',
                icon: Icon(Icons.bluetooth),
              )
            ],
          ),
          SizedBox(
            height: 100,
            child: TabBarView(
              controller: _tabController,
              children: [
                _NetworkConnection(ipController: widget.ipController),
                const _BluetoothConnection(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

final class _NetworkConnection extends StatefulWidget {
  const _NetworkConnection({
    this.ipController,
    super.key,
  });

  final TextEditingController? ipController;

  @override
  State<_NetworkConnection> createState() => _NetworkConnectionState();
}

class _NetworkConnectionState extends State<_NetworkConnection> {
  late final TextEditingController _ipController;

  @override
  void initState() {
    super.initState();
    _ipController =
        widget.ipController ?? TextEditingController(text: '192.168.0.1');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'IP Address',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 4),
        TextField(
          controller: _ipController,
          decoration: const InputDecoration(border: OutlineInputBorder()),
        ),
      ],
    );
  }
}

final class _BluetoothConnection extends StatelessWidget {
  const _BluetoothConnection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
