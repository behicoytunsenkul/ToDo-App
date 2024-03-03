//
//  ItemModel.swift
//  MetaList
//
//  Created by Oytun Şenkul on 3.03.2024.
//

import Foundation
struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
    
}
