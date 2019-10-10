//
//  PIDGlossaryView.swift
//  AutoPIDS11GM
//
//  Created by Aftab Ahmed on 02/10/2019.
//  Copyright © 2019 FAMCO. All rights reserved.
//

import SwiftUI

struct PIDGlossaryView: View {
    
    @State var text: String = ""
    
    var body: some View {
        NavigationView{
            VStack {
                SearchBar(text: $text)
                PIDList(parameterIDVals: PIDFetcher.sharedInstance.fetchPIDs(searchText: text))
                    .navigationBarTitle("OBD2 PID Glossary", displayMode: .large)
                Spacer()
            }
        }
    }
    
}








struct PIDGlossaryView_Previews: PreviewProvider {
    static var previews: some View {
        PIDGlossaryView()
    }
}
