# Link OS Multiplatform SDK for Dart

This package provides full multiplatform (Mobile - Android, iOS, Desktop - macOS, Windows, Linux) Zebra Technology [Link-OS Multiplatform SDK](https://techdocs.zebra.com/link-os/)

## Inspiration

This package was inspired due to a problem related to the fact that the current packages with Links ([zsdk](https://pub.dev/packages/zsdk), [zebrautility](https://pub.dev/packages/zebrautility)) had a number of problems:

- **Desktop support**. This package supports desktop versions based on Java for Linix, macOS, and on C# (.NET) for Windows.
- **Weak support**. Updates are too rare. Maximum Dart version 2.18 and Flutter 1.22.
- **An unfinished API**. Some SDKs don't have features like printer detection. In this package, I tried to completely replicate the API that is used in the Link OS SDK adapted for Dart.

## Supported functionality



## Getting Started


## Third Party

Before starting contribute your code generate files (in root folder):

```bash
dart run build_runner build
```