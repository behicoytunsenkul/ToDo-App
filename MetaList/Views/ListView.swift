//
//  ListView.swift
//  MetaList
//
//  Created by Oytun Şenkul on 3.03.2024.
//

import SwiftUI

struct ListView: View {
    
    
    @State private var isDarkMode = false;
    @State var items: [ItemModel] = [
        ItemModel(title: "This is the first title", isCompleted: false),
        ItemModel(title: "This is the second", isCompleted: true),
        ItemModel(title: "Third!", isCompleted: false)
    ]
    var body: some View {
        List{
            ForEach(items) { item in
                ListRowView(item: item)
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("MetaList 🚀")
        .navigationBarItems(leading:
            HStack {
                EditButton()
            Button(action: {
                isDarkMode.toggle()
            }) {
                Image(systemName: isDarkMode ? "sun.max.fill" : "moon.fill")
                    .imageScale(.large)
            }
            },
            trailing:
                NavigationLink(destination: AddView()) {
                    Text("Add")
                }
        ).preferredColorScheme(isDarkMode ? .dark : .light)

        
    }
}
struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
    }
}

