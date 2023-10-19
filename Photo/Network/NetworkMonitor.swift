//
//  NetworkMonitor.swift
//  Photo
//
//  Created by Jhon Diaz on 16/10/23.
//

import Foundation
import Network
import Reachability
import SwiftUI


class NetworkMonitor: ObservableObject {
    
    static let sharedNet = NetworkMonitor()

    enum ConnectionState {
        case noInternet
        case internetAvailable
        case unknown
    }

    func checkConnectionState() -> ConnectionState {
        let reachability = try? Reachability(hostname: "www.google.com")
        
        do {
            try reachability?.startNotifier()
        } catch {
            print("Error al iniciar la monitorización de la conexión: \(error)")
            return .unknown
        }
        
        if let reachability = reachability {
            if reachability.connection == .unavailable {
                return .noInternet
            } else {
                return .internetAvailable
            }
        }
        
        return .unknown
    }
}
