//
//  Item.swift
//  Creds
//
//  Created by Dhanajit  Kapali on 27/08/24.
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
