# Link OS Multiplatform SDK for Dart

This package provides full multiplatform (Mobile - Android, iOS, Desktop - macOS, Windows, Linux) Zebra Technology [Link-OS Multiplatform SDK](https://techdocs.zebra.com/link-os/)

## Inspiration

This package was inspired due to a problem related to the fact that the current packages with Links ([zsdk](https://pub.dev/packages/zsdk), [zebrautility](https://pub.dev/packages/zebrautility)) had a number of problems:

- **Desktop support**. This package supports desktop versions based on Java for Linix, macOS, and on C# (.NET) for Windows.
- **Weak support**. Updates are too rare. Maximum Dart version 2.18 and Flutter 1.22.
- **An unfinished API**. Some SDKs don't have features like printer detection. In this package, I tried to completely replicate the API that is used in the Link OS SDK adapted for Dart.

## Supported Functionality

| Functionality  |      iOS      |    Android    |    Windows    |     MacOS     |     Linux     |
| -------------- | ------------- | ------------- | ------------- | ------------- | ------------- |
| Connect via Bluetooth  |      ❌       |      ✅       |      ❌      |      ❌       |      ❌       |
| Connect via TCP/IP  |      ❌       |      ✅       |      ❌      |      ❌       |      ❌       |
| Printer Status  |      ❌       |      ✅       |      ❌      |      ❌       |      ❌       |
| Printer Control Language  |      ❌       |      ✅       |      ❌      |      ❌       |      ❌       |
| Print Image  |      ❌       |      ✅       |      ❌      |      ❌       |      ❌       |
| Calibrate  |      ❌       |      ✅       |      ❌      |      ❌       |      ❌       |
| Print Config. Label  |      ❌       |      ✅       |      ❌      |      ❌       |      ❌       |
| Restore to defaults |      ❌       |      ✅       |      ❌      |      ❌       |      ❌       |
| Send command |      ❌       |      ✅       |      ❌      |      ❌       |      ❌       |
| Reset |      ❌       |      ✅       |      ❌      |      ❌       |      ❌       |
| Network discovery printers |      ❌       |      ✅       |      ❌      |      ❌       |      ❌       |
| Bluetooth discovery printers |      ❌       |      ❌       |      ❌      |      ❌       |      ❌       |
| USB discovery printers |      ❌       |      ❌       |      ❌      |      ❌       |      ❌       |
| Print XML |      ❌       |      ❌       |      ❌      |      ❌       |      ❌       |
| Print CSV |      ❌       |      ❌       |      ❌      |      ❌       |      ❌       |
| Get all printer settings |      ❌       |      ❌       |      ❌      |      ❌       |      ❌       |

Where:

- ✅ - full completed
- ❌ - not completed
- ⚠️ - partial comleted

## Getting Started

You need to create an instance of the class with the connection type:

```dart
import 'package:linkos_sdk/linkos_sdk.dart';

const linkOs = LinkOS(PrinterConnection.tcpIp(ipAddress: '192.168.0.1'));
```

Printer status:

```dart
void main() async {
  final status = await linkOs.currentStatus();
}
```

## Third Party

Before starting contribute your code generate files (in root folder):

```bash
dart run build_runner build
```
