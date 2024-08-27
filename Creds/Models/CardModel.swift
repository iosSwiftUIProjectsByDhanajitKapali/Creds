//
//  CardModel.swift
//
//
//  Created by Dhanajit  Kapali on 21/08/24.
//

import Foundation

public struct CardModel: Hashable {
    let name: String
    let number: String
    let expDate: String
    let cvv: String
    let nickName: String
    
    // Method to generate an array of 5 CardModel items with random data
    static func generateRandomCards() -> [CardModel] {
        var cards = [CardModel]()
        
        for _ in 1...5 {
            let card = CardModel(
                name: ["John Doe", "Jane Smith", "Alice Brown", "Bob Johnson", "Eve Davis"].randomElement()!,
                number: String(format: "%04d %04d %04d %04d", Int.random(in: 1000...9999), Int.random(in: 1000...9999), Int.random(in: 1000...9999), Int.random(in: 1000...9999)),
                expDate: String(format: "%02d/%02d", Int.random(in: 1...12), Int.random(in: 24...30)),
                cvv: String(format: "%03d", Int.random(in: 100...999)),
                nickName: ["Personal", "Work", "Savings", "Travel", "Emergency"].randomElement()!
            )
            cards.append(card)
        }
        
        return cards
    }
}
