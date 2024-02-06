import Flutter

typealias ZConnection = NSObject & ZebraPrinterConnection

enum PrinterAPIError: Error {
    case notImplemented
    case notAssigned
}

final class ImplPrinterAPI: PrinterAPI {
    func currentStatus(info: ConnectionInfo) throws -> PrinterStatus {
        var result: PrinterStatus?
        let thr = ThreadExecutor(task: {
            do {
                let conn = try self.generalConnection(info: info)
                conn.open()
                
                defer {
                    conn.close()
                }
                
                let printer = try ZebraPrinterFactory.getInstance(conn)
                
                let status = try printer.getCurrentStatus()
                
                if status.isHeadCold {
                    result = PrinterStatus.headCold
                } else if status.isHeadOpen {
                    result = PrinterStatus.headOpen
                } else if status.isHeadTooHot {
                    result = PrinterStatus.headTooHot
                } else if status.isPaperOut {
                    result = PrinterStatus.paperOut
                } else if status.isPartialFormatInProgress {
                    result = PrinterStatus.partialFormatInProgress
                } else if status.isPaused {
                    result = PrinterStatus.paused
                } else if status.isReadyToPrint {
                    result = PrinterStatus.readyToPrint
                } else if status.isReceiveBufferFull {
                    result = PrinterStatus.receiveBufferFull
                } else if status.isRibbonOut {
                    result = PrinterStatus.ribbonOut
                }
            } catch {
                
            }
        })
        thr.start()
        thr.join()
        
        if result == nil {
            throw PrinterAPIError.notAssigned
        }
        
        return result!
    }
    
    func controlLanguage(info: ConnectionInfo) throws -> PrinterLanguage {
        return PrinterLanguage.zpl
    }
    
    func printImage(info: ConnectionInfo, data: FlutterStandardTypedData) throws {
        
    }
    
    func calibrate(info: ConnectionInfo) throws {
        
    }
    
    func printConfigurationLabel(info: ConnectionInfo) throws {
        
    }
    
    func restoreDefaults(info: ConnectionInfo) throws {
    
    }
    
    func sendCommand(info: ConnectionInfo, command: String) throws {
        
    }
    
    func reset(info: ConnectionInfo) throws {
        
    }
    
    
    private func generalConnection(info: ConnectionInfo) throws -> ZConnection {
        if let ipAddress = info.ipAddress {
            let portOrDefault = info.port != nil ? Int(info.port!) : 9100
            return TcpPrinterConnection(address: ipAddress, andWithPort: portOrDefault)
        }
        
        if let macAddress = info.macAddress {
            return MfiBtPrinterConnection(serialNumber: macAddress)
        }
        
        throw PrinterAPIError.notImplemented
    }
}
