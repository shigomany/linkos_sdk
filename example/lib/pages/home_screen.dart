import 'package:flutter/material.dart';
import 'package:linkos_sdk/linkos_sdk.dart';

import '../utils/future_states.dart';
import '../widgets/widgets.dart';
import 'discovery_printers_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DiscoveredPrinter? _discoveredPrinter;

  FutureStates<PrinterStatus> _printerStatus = const FutureStates.initial();
  FutureStates<PrinterLanguage> _printerLanguage = const FutureStates.initial();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LinkOS SDK Example'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          children: [
            ChapterBlock(
              title: 'Select Printers',
              child: Builder(
                builder: (context) {
                  if (_discoveredPrinter == null) {
                    return Column(
                      children: [
                        const Text('Printer isn\'t set'),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _handlerDiscoveryPrinters,
                            child: const Text('Discovery Printers'),
                          ),
                        )
                      ],
                    );
                  }

                  return Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          switch (_discoveredPrinter!.type) {
                            AddressType.ipAddress => Icons.wifi,
                            AddressType.macAddress => Icons.bluetooth,
                            AddressType.localName => Icons.home,
                          },
                        ),
                        title: Text(_discoveredPrinter!.address),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _handlerDiscoveryPrinters,
                          child: const Text('Select another'),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),

            // Printer Status
            ChapterBlock(
              title: 'Printer Status',
              child: Column(
                children: [
                  FutureStatesBuilder(
                    source: _printerStatus,
                    initial: () => const Text('No Data'),
                    pending: () => const CircularProgressIndicator.adaptive(),
                    success: (value) => Text(value.name),
                    failure: (error) => Text('Error: ${error.runtimeType}'),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed:
                          _discoveredPrinter == null ? null : _handleGetStatus,
                      child: const Text('Get Status'),
                    ),
                  ),
                ],
              ),
            ),
            // Control Language
            ChapterBlock(
              title: 'Control Language',
              child: Column(
                children: [
                  FutureStatesBuilder(
                    source: _printerLanguage,
                    initial: () => const Text('No Data'),
                    pending: () => const CircularProgressIndicator.adaptive(),
                    success: (value) => Text(value.name),
                    failure: (error) => Text('Error: ${error.runtimeType}'),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed:
                          _discoveredPrinter == null ? null : _handleGetLang,
                      child: const Text('Get Language'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleGetStatus() async {
    final linkOs = _instance();
    setState(() {
      _printerStatus = const FutureStates.pending();
    });

    try {
      final newStatus = await linkOs.currentStatus();

      setState(() {
        _printerStatus = FutureStates.success(value: newStatus);
      });
    } catch (e) {
      setState(() {
        _printerStatus = FutureStates.failure(error: e);
      });
    }
  }

  void _handleGetLang() async {
    final linkOs = _instance();
    setState(() {
      _printerLanguage = const FutureStates.pending();
    });

    try {
      final newLang = await linkOs.controlLanguage();

      setState(() {
        _printerLanguage = FutureStates.success(value: newLang);
      });
    } catch (e) {
      setState(() {
        _printerLanguage = FutureStates.failure(error: e);
      });
    }
  }

  LinkOS _instance() {
    return LinkOS(
      switch (_discoveredPrinter!.type) {
        AddressType.ipAddress => PrinterConnection.tcpIp(
            ipAddress: _discoveredPrinter!.address,
          ),
        _ => throw UnimplementedError()
      },
    );
  }

  void _handlerDiscoveryPrinters() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => DiscoveryPrintersScreen(
          onSelectPrinter: (value) => setState(() {
            _discoveredPrinter = value;
          }),
        ),
      ),
    );
  }
}
