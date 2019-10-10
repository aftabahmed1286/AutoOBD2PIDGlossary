//
//  PIDFetcher.swift
//  AutoPIDS11GM
//
//  Created by Aftab Ahmed on 09/10/2019.
//  Copyright © 2019 FAMCO. All rights reserved.
//

import Foundation

struct PIDOBD2 : Codable {
    
    var pidVals: [[String: String]]
    
    enum CodingKeys: CodingKey {
        case pidVals
    }
    
}

class PIDFetcher {
    
    var pidVals: [[String: String]] = []
    var searchText: String = ""
    
    static var sharedInstance: PIDFetcher = PIDFetcher()
    
    var allPidVals: [[String: String]] = []
    
    init() {
        self.allPidVals = allPidsfromJSON()
    }
    
    
    func fetchPIDs(searchText: String) -> [[String: String]]{
        if searchText.isEmpty {
            return self.allPidVals
        }
        
        let filteredPidVals = searchedParameterIds(searchText)
        return filteredPidVals
    }
    
    func allPidsfromJSON() -> [[String: String]] {
        var allPids: [[String: String]] = []
        if let path = Bundle.main.path(forResource: "PIDs", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let pidOBD2Response = try JSONDecoder().decode(PIDOBD2.self, from: data)
                print("PIDS : Aftab")
                allPids = pidOBD2Response.pidVals
            } catch let e {
                print("Error: \(e.localizedDescription)")
            }
        } else {
            print("Error: File doesnt exist!")
        }
        return allPids
    }
    
    func searchedParameterIds(_ searchText: String) -> [[String: String]] {
        if searchText.isEmpty {
            return self.allPidVals
        }
        var parIds = [[String: String]]()
        parIds = allPidVals.filter{ pidVal -> Bool in
            guard let key = Array(pidVal.keys).first,
                let val = pidVal[key]
            else {
                return false
            }
            if key.contains(searchText) || val.contains(searchText) {
                return true
            }
            return false
        }
        return parIds
    }
    
}
