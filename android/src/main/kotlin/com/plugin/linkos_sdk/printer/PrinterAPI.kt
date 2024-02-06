package com.plugin.linkos_sdk.printer

import android.graphics.BitmapFactory
import com.plugin.linkos_sdk.convertPrinterStatus
import com.zebra.sdk.comm.BluetoothConnection
import com.zebra.sdk.comm.Connection
import com.zebra.sdk.comm.ConnectionException
import com.zebra.sdk.comm.TcpConnection;
import com.zebra.sdk.graphics.ZebraImageFactory
import com.zebra.sdk.printer.ZebraPrinter
import com.zebra.sdk.printer.ZebraPrinterFactory
import com.zebra.sdk.printer.PrinterLanguage as ZPrinterLanguage

import java.lang.Exception
import java.util.Objects
import kotlin.concurrent.thread

class ImplPrinterAPI : PrinterAPI {
    override fun currentStatus(info: ConnectionInfo): PrinterStatus {
        lateinit var status: PrinterStatus

        executeThreaded(connection = connection(info), callback = { printer ->
            status = convertPrinterStatus(printer.currentStatus)
        })

        return status
    }

    override fun controlLanguage(info: ConnectionInfo): PrinterLanguage {
        lateinit var result: ZPrinterLanguage

        executeThreaded(connection = connection(info), callback = { printer ->
            result = printer.printerControlLanguage
        })

        return when(result) {
            ZPrinterLanguage.CPCL -> PrinterLanguage.CPCL
            ZPrinterLanguage.ZPL -> PrinterLanguage.ZPL
            ZPrinterLanguage.LINE_PRINT -> PrinterLanguage.LINEPRINT
        }
    }

    override fun printImage(info: ConnectionInfo, data: ByteArray) {
        executeThreaded(connection = connection(info), callback = { printer ->
            val bitmapValue = BitmapFactory.decodeByteArray(data, 0, data.size)
            val bitmapImage = ZebraImageFactory.getImage(bitmapValue)
            printer.printImage(bitmapImage, 0, 0, 0, 0, false)
        })
    }

    override fun calibrate(info: ConnectionInfo) {
        executeThreaded(connection = connection(info), callback = { printer ->
            printer.calibrate()
        })
    }

    override fun printConfigurationLabel(info: ConnectionInfo) {
        executeThreaded(connection = connection(info), callback = { printer ->
            printer.printConfigurationLabel()
        })
    }

    override fun restoreDefaults(info: ConnectionInfo) {
        executeThreaded(connection = connection(info), callback = { printer ->
            printer.restoreDefaults()
        })
    }

    override fun sendCommand(info: ConnectionInfo, command: String) {
        executeThreaded(connection = connection(info), callback = { printer ->
            printer.sendCommand(command)
        });
    }

    override fun reset(info: ConnectionInfo) {
        executeThreaded(connection = connection(info), callback = { printer ->
            printer.reset()
        });
    }

    /// Execute [callback] in non-main thread.
    /// Also [connection.open] and close after finished [callback]
    private fun executeThreaded(connection: Connection, callback: (ZebraPrinter) -> Unit) {
        var error: Exception? = null
        thread (start = true) {
            try {
                connection.open()
                val printer = ZebraPrinterFactory.getInstance(connection)
                callback(printer)
            } catch (e: Exception) {
                error = e
            } finally {
                connection.close()
            }
        }.join()

        if (error != null) {
            throw ConnectionException(error!!.message)
        }
    }

    private fun connection(info: ConnectionInfo): Connection {
        if (info.macAddress != null) {
            return BluetoothConnection(info.macAddress)
        }
        if (info.ipAddress != null) {
            val portOrDefault = info.port?.toInt() ?: TcpConnection.DEFAULT_ZPL_TCP_PORT;
            return TcpConnection(info.ipAddress, portOrDefault)
        }

        throw IllegalArgumentException()
    }
}