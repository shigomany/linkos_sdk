package com.plugin.linkos_sdk

import android.content.res.Resources.NotFoundException
import com.plugin.linkos_sdk.link_os.PrinterStatus
import com.zebra.sdk.printer.PrinterStatus as ZPrinterStatus

fun convertPrinterStatus(status: ZPrinterStatus) : PrinterStatus {
    if (status.isHeadCold) {
        return PrinterStatus.HEADCOLD
    } else if (status.isHeadOpen) {
        return PrinterStatus.HEADOPEN
    } else if (status.isHeadTooHot) {
        return  PrinterStatus.HEADTOOHOT
    } else if (status.isPaperOut) {
        return PrinterStatus.PAPEROUT
    } else if (status.isPartialFormatInProgress) {
        return PrinterStatus.PARTIALFORMATINPROGRESS
    } else if (status.isPaused) {
        return PrinterStatus.PAUSED
    } else if (status.isReadyToPrint) {
        return PrinterStatus.READYTOPRINT
    } else if (status.isReceiveBufferFull) {
        return PrinterStatus.RECEIVEBUFFERFULL
    } else if (status.isRibbonOut) {
        return PrinterStatus.RIBBONOUT
    } else {
        throw NotFoundException()
    }
}