//
//  MetaListApp.swift
//  MetaList
//
//  Created by Oytun Şenkul on 3.03.2024.
//


import SwiftUI

@main
struct MetaListApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .environmentObject(listViewModel)

        }
    }
}
