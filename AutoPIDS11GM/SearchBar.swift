//
//  SearchBar.swift
//  AutoPIDS11GM
//
//  Created by Aftab Ahmed on 09/10/2019.
//  Copyright © 2019 FAMCO. All rights reserved.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image("searchIcon")
            TextField("Search PIDs", text: $text)
        }
        .frame(height: 50, alignment: .center)
        .padding(5)
        .background(Color("SearchBarBGColor"))
        .cornerRadius(5, antialiased: true)
        .padding(.leading, 5)
        .padding(.trailing, 5)
    }
}
