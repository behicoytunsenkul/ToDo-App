import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    @State var endDate = Date()
    @State var endTime = Date()
    @State var showAlert: Bool = false
    @State var alertTitle: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Typing a new task...", text: $textFieldText)
                    .foregroundColor(.black)
                    .padding(.horizontal)
                    .frame(height: 85)
                    .background(Color(.white))
                    .cornerRadius(10)
                
                DatePicker("Select Date", selection: $endDate, displayedComponents: .date)
                    .padding()
                    .border(Color.gray)
                
                DatePicker("Select Time", selection: $endTime, displayedComponents: .hourAndMinute)
                    .padding()
                    .border(Color.gray)
                
                Button(action: saveButton, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
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
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButton() {
        if textAppropriate() {
            listViewModel.addItem(title: textFieldText, endDate: endDate, endTime: endTime)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textAppropriate() -> Bool {
        if textFieldText.count < 2 {
            alertTitle = "Your new item must be at least 2 characters!"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }

}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
