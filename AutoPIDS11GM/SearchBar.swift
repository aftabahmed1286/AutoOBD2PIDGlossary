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
    
    @ObservedObject var searchBarDelegate: SearchBarDelegate = SearchBarDelegate.shared
    
    var body: some View {
        Group {
            HStack {
                HStack {
                    Image("searchIcon")
                    TextField("Search PIDs", text: $text)
                    if searchBarDelegate.isSearchBarActive {
                        if text.isEmpty {
                            Image("cross_disabled")
                        } else {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image("cross_enabled")
                            }
                            .foregroundColor(Color.black)
                        }
                    }
                }
                .frame(height: 50, alignment: .center)
                .padding(5)
                .background(Color("SearchBarBGColor"))
                .cornerRadius(10, antialiased: true)
                .padding(.leading, 5)
                .padding(.trailing, 5)
                
                if searchBarDelegate.isSearchBarActive {
                    Button(action: {
                        self.searchBarDelegate.dismissKeyboard()
                    }) {
                        Text("Cancel")
                        }
                        .foregroundColor(Color.black)
                        .padding(.leading, 5)
                        .padding(.trailing, 15)
                }
            }
        }
    }
}

class SearchBarDelegate: ObservableObject {
    
    static var shared: SearchBarDelegate = SearchBarDelegate()
    
    @Published var isSearchBarActive: Bool = false
    
    var center: NotificationCenter = NotificationCenter.default
    
    init() {
        center.addObserver(self, selector: #selector(searchBarActive), name: UIResponder.keyboardDidShowNotification , object: nil)
        center.addObserver(self, selector: #selector(searchBarInActive), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    deinit {
        center.removeObserver(self)
    }
    
    @objc func searchBarActive() {
        isSearchBarActive = true
    }
    
    @objc func searchBarInActive() {
        isSearchBarActive = false
    }
    
    func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
    }
}
