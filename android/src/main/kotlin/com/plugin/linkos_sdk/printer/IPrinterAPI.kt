// Autogenerated from Pigeon (v16.0.5), do not edit directly.
// See also: https://pub.dev/packages/pigeon

package com.plugin.linkos_sdk.printer

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
 * Enumeration of the various printer control languages supported by Zebra Printers.
 * {@category Printer}
 */
enum class PrinterLanguage(val raw: Int) {
  /** Printer control language ZPL. */
  ZPL(0),
  /** Printer control language CPCL. */
  CPCL(1),
  /** Printer control language line_print mode. */
  LINEPRINT(2);

  companion object {
    fun ofRaw(raw: Int): PrinterLanguage? {
      return values().firstOrNull { it.raw == raw }
    }
  }
}

/**
 * Describe printer status.
 * {@category Printer}
 */
enum class PrinterStatus(val raw: Int) {
  /** The head is cold. */
  HEADCOLD(0),
  /** The head is open. */
  HEADOPEN(1),
  /** The head is too hot. */
  HEADTOOHOT(2),
  /** The paper is out. */
  PAPEROUT(3),
  /** There is a partial format in progress. */
  PARTIALFORMATINPROGRESS(4),
  /** The printer is paused. */
  PAUSED(5),
  /** The printer reports back that it is ready to print. */
  READYTOPRINT(6),
  /** The receive buffer is full. */
  RECEIVEBUFFERFULL(7),
  /** The ribbon is out. */
  RIBBONOUT(8);

  companion object {
    fun ofRaw(raw: Int): PrinterStatus? {
      return values().firstOrNull { it.raw == raw }
    }
  }
}

/**
 * {@nodoc}
 *
 * Generated class from Pigeon that represents data sent in messages.
 */
data class ConnectionInfo (
  val ipAddress: String? = null,
  val macAddress: String? = null,
  val port: Long? = null

) {
  companion object {
    @Suppress("UNCHECKED_CAST")
    fun fromList(list: List<Any?>): ConnectionInfo {
      val ipAddress = list[0] as String?
      val macAddress = list[1] as String?
      val port = list[2].let { if (it is Int) it.toLong() else it as Long? }
      return ConnectionInfo(ipAddress, macAddress, port)
    }
  }
  fun toList(): List<Any?> {
    return listOf<Any?>(
      ipAddress,
      macAddress,
      port,
    )
  }
}
@Suppress("UNCHECKED_CAST")
private object PrinterAPICodec : StandardMessageCodec() {
  override fun readValueOfType(type: Byte, buffer: ByteBuffer): Any? {
    return when (type) {
      128.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          ConnectionInfo.fromList(it)
        }
      }
      else -> super.readValueOfType(type, buffer)
    }
  }
  override fun writeValue(stream: ByteArrayOutputStream, value: Any?)   {
    when (value) {
      is ConnectionInfo -> {
        stream.write(128)
        writeValue(stream, value.toList())
      }
      else -> super.writeValue(stream, value)
    }
  }
}

/**
 * {@nodoc}
 *
 * Generated interface from Pigeon that represents a handler of messages from Flutter.
 */
interface PrinterAPI {
  /** Returns a [PrinterStatus] that can be used to determine the status of a printer. */
  fun currentStatus(info: ConnectionInfo): PrinterStatus
  /** Returns the printer control language (e.g. ZPL or CPCL) of the printer. */
  fun controlLanguage(info: ConnectionInfo): PrinterLanguage
  /** Prints an image to the connected device as a monochrome image. */
  fun printImage(info: ConnectionInfo, data: ByteArray)
  /** Sends the appropriate calibrate command to the printer. */
  fun calibrate(info: ConnectionInfo)
  /** Sends the appropriate print configuration command to the printer. */
  fun printConfigurationLabel(info: ConnectionInfo)
  /** Sends the appropriate restore defaults command to the printer. */
  fun restoreDefaults(info: ConnectionInfo)
  /** Converts the specified command to bytes using the Java default charset and sends the bytes to the printer. */
  fun sendCommand(info: ConnectionInfo, command: String)
  /** Sends the appropriate reset command to the printer. */
  fun reset(info: ConnectionInfo)

  companion object {
    /** The codec used by PrinterAPI. */
    val codec: MessageCodec<Any?> by lazy {
      PrinterAPICodec
    }
    /** Sets up an instance of `PrinterAPI` to handle messages through the `binaryMessenger`. */
    @Suppress("UNCHECKED_CAST")
    fun setUp(binaryMessenger: BinaryMessenger, api: PrinterAPI?) {
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.linkos_sdk.PrinterAPI.currentStatus", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val infoArg = args[0] as ConnectionInfo
            var wrapped: List<Any?>
            try {
              wrapped = listOf<Any?>(api.currentStatus(infoArg).raw)
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
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.linkos_sdk.PrinterAPI.controlLanguage", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val infoArg = args[0] as ConnectionInfo
            var wrapped: List<Any?>
            try {
              wrapped = listOf<Any?>(api.controlLanguage(infoArg).raw)
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
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.linkos_sdk.PrinterAPI.printImage", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val infoArg = args[0] as ConnectionInfo
            val dataArg = args[1] as ByteArray
            var wrapped: List<Any?>
            try {
              api.printImage(infoArg, dataArg)
              wrapped = listOf<Any?>(null)
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
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.linkos_sdk.PrinterAPI.calibrate", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val infoArg = args[0] as ConnectionInfo
            var wrapped: List<Any?>
            try {
              api.calibrate(infoArg)
              wrapped = listOf<Any?>(null)
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
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.linkos_sdk.PrinterAPI.printConfigurationLabel", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val infoArg = args[0] as ConnectionInfo
            var wrapped: List<Any?>
            try {
              api.printConfigurationLabel(infoArg)
              wrapped = listOf<Any?>(null)
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
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.linkos_sdk.PrinterAPI.restoreDefaults", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val infoArg = args[0] as ConnectionInfo
            var wrapped: List<Any?>
            try {
              api.restoreDefaults(infoArg)
              wrapped = listOf<Any?>(null)
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
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.linkos_sdk.PrinterAPI.sendCommand", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val infoArg = args[0] as ConnectionInfo
            val commandArg = args[1] as String
            var wrapped: List<Any?>
            try {
              api.sendCommand(infoArg, commandArg)
              wrapped = listOf<Any?>(null)
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
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.linkos_sdk.PrinterAPI.reset", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val infoArg = args[0] as ConnectionInfo
            var wrapped: List<Any?>
            try {
              api.reset(infoArg)
              wrapped = listOf<Any?>(null)
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
