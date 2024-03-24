//
//  ListView.swift
//  MetaList
//
//  Created by Oytun Şenkul on 3.03.2024.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    @State private var isDarkMode = false
    @State private var showingSettings = false
    
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                EmptyItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List{
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItemStatus(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(PlainListStyle())

            }
        }
        .navigationTitle("ToDo 🚀")
        .navigationBarItems(leading:
                                HStack {
                                    Button(action: {
                                        isDarkMode.toggle()
                                    }) {
                                        Image(systemName: isDarkMode ? "sun.max.fill" : "moon.fill")
                                            .imageScale(.large)
                                    }
                                    EditButton()
                                    
                                },
                            trailing:
                                HStack {
                                    NavigationLink(destination: AddView()) {
                                        Text("Add")
                                    }
                                    NavigationLink(destination: AsistantView()) {
                                        HStack {
                                            Image(systemName: "message.fill")
                                        }
                                    }                                    
                                    NavigationLink(destination: SendingMail()) {
                                        HStack {
                                            Image(systemName: "pencil.line")
                                        }
                                    }

                                                        })
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}
struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}

