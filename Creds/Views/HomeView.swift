//
//  HomeView.swift
//
//
//  Created by Dhanajit  Kapali on 21/08/24.
//

import SwiftUI

public struct HomeView: View {
    
    @State var debitOrCredit = 0
    @State var cards = CardModel.generateRandomCards()
    
    public init(debitOrCredit: Int = 0) {
        self.debitOrCredit = debitOrCredit
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            CardView(cardInfo: CardModel(
                name: "Dhanajit",
                number: "4000 5600 7600 8700",
                expDate: "04/28",
                cvv: "777",
                nickName: "AxisDebit")
            )
            .padding(20)
            .border(Color.black, width: 2)
            .padding(20)
            
            //segmentedCardsView()
            
            ZStack {
                wallet()
                VStack {
                    Spacer()
                    addCardButton()
                }
            }
            
            
        }
        .ignoresSafeArea(edges: .bottom)
    }
    
    @ViewBuilder func wallet() -> some View {
        VStack {
            HStack {
                Spacer()
                Text("Your Cards")
                    .fontWeight(.bold)
                Spacer()
            }
            listView(cards: cards)
        }
    }
    
    @ViewBuilder func addCardButton() -> some View {
        NavigationLink {
            AddCardView(inputCardData: { card in
                
            })
        } label: {
            Text("New Card")
                .foregroundStyle(.black)
                .frame(width: 100, height: 50)
                .background(.green)
        }
        .padding(.bottom, 35)
    }
    
    @ViewBuilder func listView(cards: [CardModel]) -> some View {
        ZStack {
            VStack {
                ZStack {
                    ForEach(Array(cards.enumerated()), id: \.element) { index, card in
                        CardView(cardInfo: card) {
                            withAnimation {
                                removeCard(at: index)
                            }
                        }
                        .stacked(at: index, in: cards.count)
                    }
                }
            }
        }
    }
    
    @ViewBuilder func segmentedCardsView() -> some View {
        Picker("", selection: $debitOrCredit) {
            Text("Credit").tag(0)
            Text("Debit").tag(1)
        }
        .pickerStyle(.segmented)
        .padding()
        
        
        TabView(selection: $debitOrCredit) {
            
            listView(cards: [])
                .tag(0)
            
            listView(cards: [])
                .tag(1)
            
            
        }
        .padding(20)
    }
    
    func removeCard(at index: Int) {
        cards.remove(at: index)
    }
}


#Preview {
    HomeView()
}


extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offSet = Double(total - position)
        return self.offset(x: 0, y: offSet * 10)
    }
}
