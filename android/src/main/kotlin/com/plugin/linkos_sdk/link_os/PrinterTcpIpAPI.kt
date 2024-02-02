package com.plugin.linkos_sdk.link_os

import android.graphics.BitmapFactory
import com.plugin.linkos_sdk.convertPrinterStatus
import com.plugin.linkos_sdk.printer.PrinterLanguage
import com.plugin.linkos_sdk.printer.PrinterStatus
import com.plugin.linkos_sdk.printer.PrinterTCPIPAPI

import com.zebra.sdk.comm.TcpConnection;

import com.zebra.sdk.graphics.ZebraImageFactory

import com.zebra.sdk.printer.ZebraPrinterFactory
import java.lang.Exception
import kotlin.concurrent.thread
import com.zebra.sdk.printer.PrinterLanguage as ZPrinterLanguage

class ImplLinkOsSdkOverTcpIpAPI : PrinterTCPIPAPI {
    override fun currentStatus(ipAddress: String, port: Long?): PrinterStatus {
        lateinit var status: PrinterStatus
        val conn = tcpConnection(ipAddress, port)

        executeThreaded(connection = conn, callback = {
            val zPrinter = ZebraPrinterFactory.getInstance(conn)

            status = convertPrinterStatus(zPrinter.currentStatus)
        })

        return status
    }

    override fun controlLanguage(ipAddress: String, port: Long?): PrinterLanguage {
        val conn = tcpConnection(ipAddress, port)

        lateinit var result: ZPrinterLanguage

        executeThreaded(connection = conn, callback = {
            val zPrinter = ZebraPrinterFactory.getInstance(conn)
            result = zPrinter.printerControlLanguage
        })

        return when(result) {
            ZPrinterLanguage.CPCL -> PrinterLanguage.CPCL
            ZPrinterLanguage.ZPL -> PrinterLanguage.ZPL
            ZPrinterLanguage.LINE_PRINT -> PrinterLanguage.LINEPRINT
        }
    }

    override fun printImage(ipAddress: String, port: Long?, data: ByteArray) {
        val conn = tcpConnection(ipAddress, port)

        executeThreaded(connection = conn, callback = {
            val zPrinter = ZebraPrinterFactory.getInstance(conn)
            val bitmapValue = BitmapFactory.decodeByteArray(data, 0, data.size)
            val bitmapImage = ZebraImageFactory.getImage(bitmapValue)
            zPrinter.printImage(bitmapImage, 0, 0, 0, 0, false)
        })
    }

    override fun calibrate(ipAddress: String, port: Long?) {
        val conn = tcpConnection(ipAddress, port)
        executeThreaded(connection = conn, callback = {
            val zPrinter = ZebraPrinterFactory.getInstance(conn)
            zPrinter.calibrate()
        })
    }

    override fun printConfigurationLabel(ipAddress: String, port: Long?) {
        val conn = tcpConnection(ipAddress, port)

        executeThreaded(connection = conn, callback = {
            val zPrinter = ZebraPrinterFactory.getInstance(conn)
            zPrinter.printConfigurationLabel()
        })
    }

    override fun restoreDefaults(ipAddress: String, port: Long?) {
        val conn = tcpConnection(ipAddress, port)
        executeThreaded(connection = conn, callback = {
            val zPrinter = ZebraPrinterFactory.getInstance(conn)
            zPrinter.restoreDefaults()
        })
    }

    override fun sendCommand(ipAddress: String, port: Long?, command: String) {
        val conn = tcpConnection(ipAddress, port)

        executeThreaded(connection = conn, callback = {
            val zPrinter = ZebraPrinterFactory.getInstance(conn)
            zPrinter.sendCommand(command)
        });
    }

    override fun reset(ipAddress: String, port: Long?) {
        val conn = tcpConnection(ipAddress, port)
        executeThreaded(connection = conn, callback = {
            val zPrinter = ZebraPrinterFactory.getInstance(conn)
            zPrinter.reset()
        });
    }

    /// Execute [callback] in non-main thread.
    /// Also [connection.open] and close after finished [callback]
    private fun executeThreaded(connection: TcpConnection, callback: () -> Unit) {
            thread (start = true) {
                try {
                    connection.open()

                    callback()
                } catch (_: Exception) {

                } finally {
                    connection.close()
                }
            }.join()

    }

    private fun tcpConnection(ipAddress: String, port: Long?): TcpConnection {
        val portOrDefault = port?.toInt() ?: TcpConnection.DEFAULT_ZPL_TCP_PORT;
        return TcpConnection(ipAddress, portOrDefault)
    }
}