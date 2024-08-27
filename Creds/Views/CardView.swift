//
//  SwiftUIView.swift
//  
//
//  Created by Dhanajit  Kapali on 21/08/24.
//

import SwiftUI

public struct CardView: View {
    
    public let cardInfo: CardModel
    public init(cardInfo: CardModel) {
        self.cardInfo = cardInfo
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Text(cardInfo.nickName)
                    .fontWeight(.bold)
            }
            Text(cardInfo.name)
                .fontWeight(.medium)
            
            HStack {
                Text(cardInfo.number)
                    .padding(.horizontal,5)
                    .padding(.vertical,2)
                    .background {
                        Color.gray.opacity(0.3)
                            .cornerRadius(10)
                    }
                    .offset(x: -5)
                
                Button(action: {
                    
                }, label: {
                    Text("Copy")
                        .background {
                            Circle().fill(.yellow.opacity(0.5))
                                .frame(width: 45, height: 45)
                        }
                        .foregroundColor(.black)
                })
            }
            Text(cardInfo.expDate)
                .fontWeight(.medium)
            
            Text("cvv -- " + cardInfo.cvv)
                .fontWeight(.medium)
        }
        .padding(20)
        .background(.pink)
        .cornerRadius(20)
    }
}

#Preview {
    CardView(cardInfo: CardModel(
        name: "Dhanajit",
        number: "4000 5600 7600 8700",
        expDate: "04/28",
        cvv: "777",
        nickName: "AxisDebit")
    )
}
