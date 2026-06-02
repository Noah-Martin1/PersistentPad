//
//  Item.swift
//  PersistentPad
//
//  Created by Noah Martin on 2/6/2026.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
