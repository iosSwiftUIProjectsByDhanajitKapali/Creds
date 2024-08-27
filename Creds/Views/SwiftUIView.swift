//
//  SwiftUIView.swift
//
//
//  Created by Dhanajit  Kapali on 22/08/24.
//

import SwiftUI

struct AddCardView: View {
    
    @State var nickName: String = ""
    @State var name: String = ""
    @State var number: String = ""
    @State var expDate: String = ""
    @State var cvv: String = ""
    
    @State private var showingError = false
    @State private var errorMessage = ""
    
    var inputCardData: (CardModel) -> Void
    
    var body: some View {
        VStack {
            TextField("Enter nickName", text: $nickName)
                .border(Color.black, width: 2)
                .font(.title)
                .padding(5)
            
            TextField("Enter name", text: $name)
                .border(Color.black, width: 2)
                .font(.title)
                .padding(5)
            
            TextField("Enter number", text: $number)
                .keyboardType(.numberPad)
                .border(Color.black, width: 2)
                .font(.title)
                .padding(5)
            
            TextField("Enter expDate", text: $expDate)
                .keyboardType(.numberPad)
                .border(Color.black, width: 2)
                .font(.title)
                .padding(5)
            
            TextField("Enter cvv", text: $cvv)
                .keyboardType(.numberPad)
                .border(Color.black, width: 2)
                .font(.title)
                .padding(5)
            
            
            Button(action: {
                validateAndSave()
            }, label: {
                Text("Save")
            })
            .padding(.top, 20)
            
            if showingError {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding(.top, 10)
            }
        }
        .padding()
    }
    
    // Method to validate the input fields and pass data through closure if valid
    private func validateAndSave() {
        guard !nickName.isEmpty else {
            showError("Nickname cannot be empty.")
            return
        }
        
        guard !name.isEmpty else {
            showError("Name cannot be empty.")
            return
        }
        
        guard number.count == 16, Int(number) != nil else {
            showError("Card number must be 16 digits.")
            return
        }
        
        guard expDate.count == 5 else {
            showError("Expiration date must be in MM/YY format.")
            return
        }
        
        guard cvv.count == 3, Int(cvv) != nil else {
            showError("CVV must be 3 digits.")
            return
        }
        
        // All fields are valid, create CardModel and pass it through the closure
        let card = CardModel(name: name, number: number, expDate: expDate, cvv: cvv, nickName: nickName)
        inputCardData(card)
        showError("") // Clear the error message on success
    }
    
    // Method to show an error message and control visibility
    private func showError(_ message: String) {
        errorMessage = message
        showingError = !message.isEmpty
    }
}

#Preview {
    AddCardView(inputCardData: {_ in })
}
