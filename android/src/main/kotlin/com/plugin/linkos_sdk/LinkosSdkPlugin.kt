package com.plugin.linkos_sdk

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
// Printer API
import com.plugin.linkos_sdk.printer.ImplPrinterAPI
import com.plugin.linkos_sdk.printer.PrinterAPI
// Discovery Printers API
import com.plugin.linkos_sdk.discovery.NetworkDiscoveryPrintersAPI
import com.plugin.linkos_sdk.discovery.ImplNetworkDiscoveryPrintersAPI

/** LinkosSdkPlugin */
class LinkosSdkPlugin: FlutterPlugin, MethodCallHandler {

  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "linkos_sdk")
    channel.setMethodCallHandler(this)
    PrinterAPI.setUp(flutterPluginBinding.binaryMessenger, api = ImplPrinterAPI())
    NetworkDiscoveryPrintersAPI.setUp(flutterPluginBinding.binaryMessenger, api = ImplNetworkDiscoveryPrintersAPI())
  }

  override fun onMethodCall(call: MethodCall, result: Result) {}

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
