// Autogenerated from Pigeon (v16.0.5), do not edit directly.
// See also: https://pub.dev/packages/pigeon

package com.plugin.linkos_sdk.discovery

import android.util.Log
import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MessageCodec
import io.flutter.plugin.common.StandardMessageCodec
import java.io.ByteArrayOutputStream
import java.nio.ByteBuffer

private fun wrapResult(result: Any?): List<Any?> {
  return listOf(result)
}

private fun wrapError(exception: Throwable): List<Any?> {
  if (exception is FlutterError) {
    return listOf(
      exception.code,
      exception.message,
      exception.details
    )
  } else {
    return listOf(
      exception.javaClass.simpleName,
      exception.toString(),
      "Cause: " + exception.cause + ", Stacktrace: " + Log.getStackTraceString(exception)
    )
  }
}

/**
 * Error class for passing custom error details to Flutter via a thrown PlatformException.
 * @property code The error code.
 * @property message The error message.
 * @property details The error details. Must be a datatype supported by the api codec.
 */
class FlutterError (
  val code: String,
  override val message: String? = null,
  val details: Any? = null
) : Throwable()
/**
 * {@nodoc}
 *
 * Generated interface from Pigeon that represents a handler of messages from Flutter.
 */
interface NetworkDiscoveryPrintersAPI {
  fun subnetSearch(subnetRange: String, waitForResponsesTimeout: Long?): List<String>
  fun directedBroadcast(ipAddress: String, waitForResponsesTimeout: Long?): List<String>
  fun localBroadcast(waitForResponsesTimeout: Long?): List<String>
  fun multicast(hops: Long, waitForResponsesTimeout: Long?): List<String>
  fun findPrinters(printersToFind: List<String>?, waitForResponsesTimeout: Long?): List<String>

  companion object {
    /** The codec used by NetworkDiscoveryPrintersAPI. */
    val codec: MessageCodec<Any?> by lazy {
      StandardMessageCodec()
    }
    /** Sets up an instance of `NetworkDiscoveryPrintersAPI` to handle messages through the `binaryMessenger`. */
    @Suppress("UNCHECKED_CAST")
    fun setUp(binaryMessenger: BinaryMessenger, api: NetworkDiscoveryPrintersAPI?) {
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.linkos_sdk.NetworkDiscoveryPrintersAPI.subnetSearch", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val subnetRangeArg = args[0] as String
            val waitForResponsesTimeoutArg = args[1].let { if (it is Int) it.toLong() else it as Long? }
            var wrapped: List<Any?>
            try {
              wrapped = listOf<Any?>(api.subnetSearch(subnetRangeArg, waitForResponsesTimeoutArg))
            } catch (exception: Throwable) {
              wrapped = wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.linkos_sdk.NetworkDiscoveryPrintersAPI.directedBroadcast", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val ipAddressArg = args[0] as String
            val waitForResponsesTimeoutArg = args[1].let { if (it is Int) it.toLong() else it as Long? }
            var wrapped: List<Any?>
            try {
              wrapped = listOf<Any?>(api.directedBroadcast(ipAddressArg, waitForResponsesTimeoutArg))
            } catch (exception: Throwable) {
              wrapped = wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.linkos_sdk.NetworkDiscoveryPrintersAPI.localBroadcast", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val waitForResponsesTimeoutArg = args[0].let { if (it is Int) it.toLong() else it as Long? }
            var wrapped: List<Any?>
            try {
              wrapped = listOf<Any?>(api.localBroadcast(waitForResponsesTimeoutArg))
            } catch (exception: Throwable) {
              wrapped = wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.linkos_sdk.NetworkDiscoveryPrintersAPI.multicast", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val hopsArg = args[0].let { if (it is Int) it.toLong() else it as Long }
            val waitForResponsesTimeoutArg = args[1].let { if (it is Int) it.toLong() else it as Long? }
            var wrapped: List<Any?>
            try {
              wrapped = listOf<Any?>(api.multicast(hopsArg, waitForResponsesTimeoutArg))
            } catch (exception: Throwable) {
              wrapped = wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.linkos_sdk.NetworkDiscoveryPrintersAPI.findPrinters", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val printersToFindArg = args[0] as List<String>?
            val waitForResponsesTimeoutArg = args[1].let { if (it is Int) it.toLong() else it as Long? }
            var wrapped: List<Any?>
            try {
              wrapped = listOf<Any?>(api.findPrinters(printersToFindArg, waitForResponsesTimeoutArg))
            } catch (exception: Throwable) {
              wrapped = wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
    }
  }
}
