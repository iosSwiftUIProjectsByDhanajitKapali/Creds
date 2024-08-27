//
//  HomeView.swift
//
//
//  Created by Dhanajit  Kapali on 21/08/24.
//

import SwiftUI

public struct HomeView: View {
    
    @State var debitOrCredit = 0
    
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
            listView(cards: [])
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
        ScrollView() {
            ForEach(CardModel.generateRandomCards(), id: \.self) { card in
                CardView(cardInfo: card)
                    .padding()
            }
        }
        .scrollIndicators(.hidden)
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
}


#Preview {
    HomeView()
}
