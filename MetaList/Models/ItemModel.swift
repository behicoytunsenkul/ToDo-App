//
//  ItemModel.swift
//  MetaList
//
//  Created by Oytun Şenkul on 3.03.2024.
//

import Foundation
struct ItemModel: Identifiable, Codable {
    //let taskid: Int
    let id: String
    let title: String
    let isCompleted: Bool
    let endDate: Date
    let endTime: Date
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool, endDate: Date, endTime: Date) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        self.endDate = endDate
        self.endTime = endTime
        
    }
    func updateCompleted() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted, endDate: endDate, endTime: endTime)
    }
}
