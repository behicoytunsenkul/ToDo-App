import SwiftUI
import UserNotifications
struct ListRowView: View {
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Text(formatDate(item.endDate, time: item.endTime)) // Burada endDate ve endTime'i birleştirip ekrana yazdırıyoruz.
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
    
    func formatDate(_ date: Date, time: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let dateString = dateFormatter.string(from: date)
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"
        let timeString = timeFormatter.string(from: time)
        
        return "\(dateString) \(timeString)"
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var item1 = ItemModel(title: "First Item", isCompleted: false, endDate: Date(), endTime: Date())
    static var item2 = ItemModel(title: "Second Item", isCompleted: true, endDate: Date(), endTime: Date())
    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
