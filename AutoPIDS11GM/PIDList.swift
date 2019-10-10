//
//  PIDList.swift
//  AutoPIDS11GM
//
//  Created by Aftab Ahmed on 09/10/2019.
//  Copyright © 2019 FAMCO. All rights reserved.
//

import SwiftUI

struct PIDList: View {
    
    var parameterIDVals = [[String: String]]()
    
    var body: some View {
        Group {
            if self.parameterIDVals.isEmpty {
                Text("No Parmaeter Ids for the Search Made")
            } else {
                List {
                    ForEach(0..<self.parameterIDVals.count, id: \.self) { row in
                        VStack (alignment: .leading) {
                            PIDTitle(title: "\(self.pidAndDescription(row).pid)")
                            PIDDescription(description: "\(self.pidAndDescription(row).description)")
                        }
                    }
                }
            }
        }
    }
    
    func pidAndDescription(_ row: Int) -> (pid: String, description: String){
        let id = Array(self.parameterIDVals[row].keys)[0]
        let desc = self.parameterIDVals[row][id]
        return (id, desc ?? "")
    }
}

struct PIDTitle: View {
    
    var title: String = ""
    
    var body: some View {
        Text(title)
            .font(.headline)
            .lineLimit(nil)
    }
}

struct PIDDescription: View {
    var description: String = ""
    var body: some View {
        HStack {
            Text(description)
                .font(.subheadline)
                .lineLimit(nil)
        }
    }
}
