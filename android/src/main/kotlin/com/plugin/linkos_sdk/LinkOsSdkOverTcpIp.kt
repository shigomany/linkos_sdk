package com.plugin.linkos_sdk

import android.graphics.BitmapFactory

import com.zebra.sdk.comm.TcpConnection;

import com.zebra.sdk.graphics.ZebraImageFactory

import com.zebra.sdk.printer.ZebraPrinterFactory
import kotlin.concurrent.thread
import com.zebra.sdk.printer.PrinterLanguage as ZPrinterLanguage

class ImplLinkOsSdkOverTcpIp : LinkOsSdkOverTcpIp {
    override fun currentStatus(ipAddress: String, port: Long?): PrinterStatus {
        lateinit var status: PrinterStatus
        val conn = tcpConnection(ipAddress, port)
        val thr = Thread {

            conn.open()

            val zPrinter = ZebraPrinterFactory.getInstance(conn)

            status = convertPrinterStatus(zPrinter.currentStatus)

        }
        thr.start()
        thr.join(3000)
        conn.close()

        return status
    }

    override fun controlLanguage(ipAddress: String, port: Long?): PrinterLanguage {
        val conn = tcpConnection(ipAddress, port)
        conn.open()

        val zPrinter = ZebraPrinterFactory.getInstance(conn)

        val result = zPrinter.printerControlLanguage

        conn.close()

        return when(result) {
            ZPrinterLanguage.CPCL -> PrinterLanguage.CPCL
            ZPrinterLanguage.ZPL -> PrinterLanguage.ZPL
            ZPrinterLanguage.LINE_PRINT -> PrinterLanguage.LINEPRINT
        }
    }

    override fun printImage(ipAddress: String, port: Long?, data: ByteArray) {
        val conn = tcpConnection(ipAddress, port)
        conn.open()

        val zPrinter = ZebraPrinterFactory.getInstance(conn)
        val bitmapImage = ZebraImageFactory.getImage(BitmapFactory.decodeByteArray(data, 0, data.size))
        zPrinter.printImage(bitmapImage, 0, 0, 0, 0, false)

        conn.close()
    }

    override fun calibrate(ipAddress: String, port: Long?) {
        val conn = tcpConnection(ipAddress, port)
        conn.open()

        val zPrinter = ZebraPrinterFactory.getInstance(conn)
        zPrinter.calibrate()

        conn.close()
    }

    override fun printConfigurationLabel(ipAddress: String, port: Long?) {
        val conn = tcpConnection(ipAddress, port)
        conn.open()

        val zPrinter = ZebraPrinterFactory.getInstance(conn)
        zPrinter.printConfigurationLabel()

        conn.close()
    }

    override fun restoreDefaults(ipAddress: String, port: Long?) {
        val conn = tcpConnection(ipAddress, port)
        conn.open()

        val zPrinter = ZebraPrinterFactory.getInstance(conn)
        zPrinter.restoreDefaults()

        conn.close()
    }

    override fun sendCommand(ipAddress: String, port: Long?, command: String) {
        val conn = tcpConnection(ipAddress, port)
        conn.open()

        val zPrinter = ZebraPrinterFactory.getInstance(conn)
        zPrinter.sendCommand(command)

        conn.close()
    }

    override fun reset(ipAddress: String, port: Long?) {
        val conn = tcpConnection(ipAddress, port)
        conn.open()

        val zPrinter = ZebraPrinterFactory.getInstance(conn)
        zPrinter.reset()

        conn.close()
    }

    private fun tcpConnection(ipAddress: String, port: Long?): TcpConnection {
        val portOrDefault = port?.toInt() ?: TcpConnection.DEFAULT_ZPL_TCP_PORT;
        return TcpConnection(ipAddress, portOrDefault)
    }
}