//
//  NotificationService.swift
//  MetaList
//
//  Created by Oytun Şenkul on 12.03.2024.
//
import Foundation
import UserNotifications

class NotificationService {
    static let shared = NotificationService()

    private init() {}

    func start() {
        Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { _ in
            self.checkNotifications()
        }
    }

    private func checkNotifications() {
        let currentDate = Date()
        // items içindeki her bir öğeyi kontrol edin ve eğer tarih ve saat geçmişse bildirim gönderin.
        for item in ListViewModel.items {
            if item.endDate < currentDate {
                scheduleNotification(title: "Bildirim Başlığı", body: "Bildirim içeriği", date: item.endDate)
            }
        }
    }
}
