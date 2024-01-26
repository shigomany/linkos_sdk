// Autogenerated from Pigeon (v16.0.4), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import, no_leading_underscores_for_local_identifiers

import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;

import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';

PlatformException _createConnectionError(String channelName) {
  return PlatformException(
    code: 'channel-error',
    message: 'Unable to establish connection on channel: "$channelName".',
  );
}

List<Object?> wrapResponse({Object? result, PlatformException? error, bool empty = false}) {
  if (empty) {
    return <Object?>[];
  }
  if (error == null) {
    return <Object?>[result];
  }
  return <Object?>[error.code, error.message, error.details];
}

/// Enumeration of the various printer control languages supported by Zebra Printers.
enum PrinterLanguage {
  /// Printer control language ZPL.
  zpl,
  /// Printer control language CPCL.
  cpcl,
  /// Printer control language line_print mode.
  linePrint,
}

/// Describe printer status.
enum PrinterStatus {
  /// The head is cold.
  headCold,
  /// The head is open.
  headOpen,
  /// The head is too hot.
  headTooHot,
  /// The paper is out.
  paperOut,
  /// There is a partial format in progress.
  partialFormatInProgress,
  /// The printer is paused.
  paused,
  /// The printer reports back that it is ready to print.
  readyToPrint,
  /// The receive buffer is full.
  receiveBufferFull,
  /// The ribbon is out.
  ribbonOut,
}

class LinkOsSdkOverTcpIp {
  /// Constructor for [LinkOsSdkOverTcpIp].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  LinkOsSdkOverTcpIp({BinaryMessenger? binaryMessenger})
      : __pigeon_binaryMessenger = binaryMessenger;
  final BinaryMessenger? __pigeon_binaryMessenger;

  static const MessageCodec<Object?> pigeonChannelCodec = StandardMessageCodec();

  /// Returns a [PrinterStatus] that can be used to determine the status of a printer.
  Future<PrinterStatus> currentStatus(String ipAddress, int port) async {
    const String __pigeon_channelName = 'dev.flutter.pigeon.linkos_sdk.LinkOsSdkOverTcpIp.currentStatus';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[ipAddress, port]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else if (__pigeon_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return PrinterStatus.values[__pigeon_replyList[0]! as int];
    }
  }

  /// Returns the printer control language (e.g. ZPL or CPCL) of the printer.
  Future<PrinterLanguage> controlLanguage(String ipAddress, int port) async {
    const String __pigeon_channelName = 'dev.flutter.pigeon.linkos_sdk.LinkOsSdkOverTcpIp.controlLanguage';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[ipAddress, port]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else if (__pigeon_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return PrinterLanguage.values[__pigeon_replyList[0]! as int];
    }
  }

  /// Prints an image to the connected device as a monochrome image.
  Future<void> printImage(String ipAddress, int port, Uint8List data) async {
    const String __pigeon_channelName = 'dev.flutter.pigeon.linkos_sdk.LinkOsSdkOverTcpIp.printImage';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[ipAddress, port, data]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }

  /// Sends the appropriate calibrate command to the printer.
  Future<void> calibrate(String ipAddress, int port) async {
    const String __pigeon_channelName = 'dev.flutter.pigeon.linkos_sdk.LinkOsSdkOverTcpIp.calibrate';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[ipAddress, port]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }

  /// Sends the appropriate print configuration command to the printer.
  Future<void> printConfigurationLabel(String ipAddress, int port) async {
    const String __pigeon_channelName = 'dev.flutter.pigeon.linkos_sdk.LinkOsSdkOverTcpIp.printConfigurationLabel';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[ipAddress, port]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }

  /// Sends the appropriate restore defaults command to the printer.
  Future<void> restoreDefaults(String ipAddress, int port) async {
    const String __pigeon_channelName = 'dev.flutter.pigeon.linkos_sdk.LinkOsSdkOverTcpIp.restoreDefaults';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[ipAddress, port]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }

  /// Converts the specified command to bytes using the Java default charset and sends the bytes to the printer.
  Future<void> sendCommand(String ipAddress, int port, String command) async {
    const String __pigeon_channelName = 'dev.flutter.pigeon.linkos_sdk.LinkOsSdkOverTcpIp.sendCommand';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[ipAddress, port, command]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }

  /// Sends the appropriate reset command to the printer.
  Future<void> reset(String ipAddress, int port) async {
    const String __pigeon_channelName = 'dev.flutter.pigeon.linkos_sdk.LinkOsSdkOverTcpIp.reset';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[ipAddress, port]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }
}
