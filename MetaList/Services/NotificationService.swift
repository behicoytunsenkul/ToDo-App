import Foundation
import UserNotifications

class NotificationService {
    static let shared = NotificationService()
    
    private var isServiceRunning = false // Bildirim servisinin çalışıp çalışmadığını takip eden bir değişken
    
    private init() {}
    
    func start() {
        // Bildirim servisini başlat
        Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { _ in
            self.checkTasks()
        }
        isServiceRunning = true // Bildirim servisi başladığında bu değişkeni true yap
    }
    
    func stop() {
        // Bildirim servisini durdur
        // Burada bildirim servisinin durdurulması için gerekli kodlar yer almalı
        isServiceRunning = false // Bildirim servisi durduğunda bu değişkeni false yap
    }
    
    func checkTasks() {
        let viewModel = ListViewModel()
        let calendar = Calendar.current
        let currentDate = Date()
        
        // Tüm kaydedilen görevleri al
        for item in viewModel.items {
            // Görevin son tarihini ve saati al
            let components = calendar.dateComponents([.hour, .minute], from: item.endTime)
            if let hour = components.hour, let minute = components.minute {
                if let endDate = calendar.date(bySettingHour: hour, minute: minute, second: 0, of: item.endDate) {
                    // Görevin son tarihi geçmişse bildirim gönder
                    if endDate < currentDate {
                        sendNotification(for: item)
                    }
                }
            }
        }
    }
    
    func sendNotification(for item: ItemModel) {
        let content = UNMutableNotificationContent()
        content.title = "Task Reminder"
        content.body = "\(item.title) is due."
        content.sound = UNNotificationSound.default
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: nil)
        
        UNUserNotificationCenter.current().add(request)
    }
}
