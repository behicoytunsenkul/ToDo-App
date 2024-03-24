//
//  SendingMail.swift
//  MetaList
//
//  Created by Oytun Şenkul on 14.03.2024.
//

import SwiftUI

struct SendingMail: View {
    @State private var title = ""
    @State private var bodyText = ""
    @State private var selectedOption = "Bug"
    
    let options = ["Bug", "Request"]
    
    var body: some View {
        VStack {
            Text("Contact Us")
                .font(.title)
                .padding()
            
            TextField("Title", text: $title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextEditor(text: $bodyText)
                .frame(height: 200)
                .padding()
            
            Picker(selection: $selectedOption, label: Text("Select an option")) {
                ForEach(options, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            Button(action: {
                sendMail()
            }) {
                Text("Submit")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Spacer()
        }
        .padding()
    }
    
    private func sendMail() {
        // Gerekli verileri al
        let recipientEmail = "metamindevolution@gmail.com"
        let subject = selectedOption
        let body = "\(title)\n\n\(bodyText)"
        
        // Mail at
        if let url = URL(string: "mailto:\(recipientEmail)?subject=\(subject)&body=\(body)"), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
}

struct SendingMail_Previews: PreviewProvider {
    static var previews: some View {
        SendingMail()
    }
}
