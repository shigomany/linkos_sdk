package com.plugin.linkos_sdk.discovery

import com.zebra.sdk.printer.discovery.DiscoveryHandler
import com.zebra.sdk.printer.discovery.NetworkDiscoverer
import kotlin.concurrent.thread
import com.zebra.sdk.printer.discovery.DiscoveredPrinter as ZDiscoveredPrinter


private class WrapperValue<T>(var value: T)

class ImplNetworkDiscoveryPrintersAPI: NetworkDiscoveryPrintersAPI {

    private fun runThreadedBlocked(callback: (handler: DiscoveryHandler) -> Unit): List<String> {
        val printers: MutableList<String> = ArrayList()
        val isBlocked = WrapperValue(true);
        thread(start = true) {
            try {
                val handler = object: DiscoveryHandler {

                    override fun foundPrinter(printer: ZDiscoveredPrinter) {
                        printers.add(printer.address)
                    }

                    override fun discoveryFinished() {
                        isBlocked.value = false
                    }

                    override fun discoveryError(message: String) {
                        isBlocked.value = false
                    }
                }
                callback(handler)
            } catch (_: Exception) {
                isBlocked.value = false
            }
            while (isBlocked.value) {
                Thread.sleep(10)
            }
        }.join()

        return printers
    }

    override fun subnetSearch(subnetRange: String, waitForResponsesTimeout: Long?): List<String> {
        val printers = runThreadedBlocked { handler ->

            if (waitForResponsesTimeout != null) {
                NetworkDiscoverer.subnetSearch(handler, subnetRange, waitForResponsesTimeout.toInt())
            } else {
                NetworkDiscoverer.subnetSearch(handler, subnetRange)
            }
        }

        return printers
    }

    override fun directedBroadcast(ipAddress: String, waitForResponsesTimeout: Long?): List<String> {

        val printers = runThreadedBlocked { handler ->

            if (waitForResponsesTimeout != null) {
                NetworkDiscoverer.directedBroadcast(handler, ipAddress, waitForResponsesTimeout.toInt())
            } else {
                NetworkDiscoverer.directedBroadcast(handler, ipAddress)
            }
        }

        return printers
    }

    override fun localBroadcast(waitForResponsesTimeout: Long?): List<String> {

        val printers = runThreadedBlocked { handler ->

            if (waitForResponsesTimeout != null) {
                NetworkDiscoverer.localBroadcast(handler, waitForResponsesTimeout.toInt())
            } else {
                NetworkDiscoverer.localBroadcast(handler)
            }
        }

        return printers
    }

    override fun multicast(hops: Long, waitForResponsesTimeout: Long?): List<String> {

        val printers = runThreadedBlocked { handler ->

            if (waitForResponsesTimeout != null) {
                NetworkDiscoverer.multicast(handler, hops.toInt(), waitForResponsesTimeout.toInt())
            } else {
                NetworkDiscoverer.multicast(handler, hops.toInt())
            }
        }

        return printers
    }

    override fun findPrinters(printersToFind: List<String>?, waitForResponsesTimeout: Long?): List<String> {
        val printers = runThreadedBlocked { handler ->

            if (printersToFind != null && waitForResponsesTimeout == null) {
                NetworkDiscoverer.findPrinters(handler, printersToFind)
            } else if (printersToFind != null && waitForResponsesTimeout != null) {
                NetworkDiscoverer.findPrinters(handler, printersToFind, waitForResponsesTimeout.toInt())
            } else {
                NetworkDiscoverer.findPrinters(handler)
            }
        }

        return printers
    }
}