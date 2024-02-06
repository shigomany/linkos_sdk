
class ImplNetworkDiscoveryPrintersAPI: NetworkDiscoveryPrintersAPI {
    func subnetSearch(subnetRange: String, waitForResponsesTimeout: Int64?) throws -> [String] {
        
//        do {
//            if let timeout = waitForResponsesTimeout {
//                
//                let result = try NetworkDiscoverer.subnetSearch(withRange: subnetRange, andWaitForResponsesTimeout: Int(timeout));
//                
//            }
//        } catch {
//            
//        }
        return []
    }
    
    func directedBroadcast(ipAddress: String, waitForResponsesTimeout: Int64?) throws -> [String] {
        return []
    }
    
    func localBroadcast(waitForResponsesTimeout: Int64?) throws -> [String] {
        return []
    }
    
    func multicast(hops: Int64, waitForResponsesTimeout: Int64?) throws -> [String] {
        return []
    }
    
    func findPrinters(printersToFind: [String]?, waitForResponsesTimeout: Int64?) throws -> [String] {
        return []
    }
    
    
}
