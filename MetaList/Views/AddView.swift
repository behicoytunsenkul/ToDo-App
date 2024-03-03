//
//  AddView.swift
//  MetaList
//
//  Created by Oytun Şenkul on 3.03.2024.
//

import SwiftUI

struct AddView: View {
    
    @State var textFieldText: String = ""
    var body: some View {
        ScrollView {
            VStack{
                TextField("Typing a new task...", text:$textFieldText)
                    .padding(.horizontal)
                    .frame(height: 85)
                    .background(Color(.white))
                    .cornerRadius(10)
                
                Button(action: {
                    
                }, label:{
                    Text("Save".uppercased())
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding(14)
        }
        .navigationTitle("Add a new item")

    }
}

#Preview {
    AddView()
}
