import 'dart:async';

import 'package:flutter/material.dart';
import 'package:linkos_sdk/linkos_sdk.dart';
import 'package:linkos_sdk_example/connection_types.dart';

import 'future_state_builder.dart';
import 'utils/future_states.dart';

void main() {
  runApp(
    MaterialApp(
      home: const MyApp(),
      theme: ThemeData(useMaterial3: true),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  final _ipController = TextEditingController(text: '192.168.0.54');
  // final _macAddressController = TextEditingController()
  late final TabController _connectionController;

  FutureStates<PrinterStatus> _printerStatus = const FutureStates.initial();

  @override
  void initState() {
    super.initState();
    _connectionController = TabController(length: 2, vsync: this);
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
            ConnectionTypes(
              connectionTypeController: _connectionController,
              ipController: _ipController,
            ),
            Container(
              margin: const EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).highlightColor),
              padding: const EdgeInsets.all(4),
              child: SizedBox(
                width: double.infinity,
                child: Center(
                  child: FutureStatesBuilder(
                    source: _printerStatus,
                    initial: () => const Text('No Data'),
                    pending: () => const CircularProgressIndicator.adaptive(),
                    success: (value) => Text(value.name),
                    failure: (error) =>
                        Text('Error with printer status: $error'),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _handleGetStatus,
                child: const Text('Get Status'),
              ),
            )
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

  LinkOS _instance() {
    return LinkOS(
      switch (_connectionController.index) {
        == 0 => PrinterConnection.tcpIp(ipAddress: _ipController.text),
        _ => throw UnimplementedError()
      },
    );
  }
}
