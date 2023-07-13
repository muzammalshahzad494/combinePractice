//
//  HomeViewModel.swift
//  CombinePracticeModule
//
//  Created by Muzammal Shahzad on 6/17/23.
//

import SwiftUI

struct HomeView: View {
    
    private let cardTitles = ["Card 1", "Card 2", "Card 3", "Card 4", "Card 5"]
    @State private var cards: [Card] = []
    @State private var isPresentingAddCard = false
    
    var body: some View {
        VStack {
            List {
                ForEach(cards.indices, id: \.self) { index in
                    CardView(card: cards[index])
                }
                .onDelete(perform: deleteCard)
            }
            .listStyle(InsetGroupedListStyle())
            
            Button(action: {
                isPresentingAddCard = true
            }) {
                Image(systemName: "plus.circle.fill")
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .clipShape(Circle())
            }
            .padding(.bottom)
            .sheet(isPresented: $isPresentingAddCard) {
                AddCardView(addCard: { newCard in
                    cards.append(newCard)
                })
            }
        }
    }
    
    private func deleteCard(at offsets: IndexSet) {
        cards.remove(atOffsets: offsets)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct CardView: View {
    let card: Card
    
    var body: some View {
        VStack {
            Text(card.title)
                .font(.title)
                .foregroundColor(.black)
            
            Image(card.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: UIScreen.main.bounds.width / 4)
                .cornerRadius(8)
            
            Text(card.description)
                .font(.body)
                .foregroundColor(.black)
            
            Spacer()
            
            Button(action: {
                // Button action
                // Perform action when forward button is clicked
            }) {
                HStack {
                    Text("Forward")
                        .font(.body)
                        .foregroundColor(.white)
                    
                    Image(systemName: "arrow.right")
                        .foregroundColor(.white)
                }
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .background(Color.blue)
                .cornerRadius(8)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(radius: 4)
        .padding(.vertical, 8)
    }
}

struct AddCardView: View {
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var imageName: String = ""
    @State private var isShowingAlert = false
    
    let addCard: (Card) -> Void
    
    var body: some View {
        VStack {
            TextField("Title", text: $title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Description", text: $description)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Image Name", text: $imageName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                if !title.isEmpty && !description.isEmpty && !imageName.isEmpty {
                    let newCard = Card(title: title, description: description, image: imageName)
                    addCard(newCard)
                } else {
                    isShowingAlert = true
                }
            }) {
                Text("Add Card")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .alert(isPresented: $isShowingAlert) {
                Alert(title: Text("Error"), message: Text("Please fill in all the fields."), dismissButton: .default(Text("OK")))
            }
            
            Spacer()
        }
        .padding()
    }
}

struct Card: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let image: String
}
