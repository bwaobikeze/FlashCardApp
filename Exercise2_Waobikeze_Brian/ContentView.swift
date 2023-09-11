//
//  ContentView.swift
//  Exercise2_Waobikeze_Brian
//
//  Created by brian waobikeze on 9/2/23.
//

import SwiftUI

class CardData: ObservableObject {
    @Published var cardTitle: [String] = ["View Controller", "UIKit", "UIAlertController"]
    @Published var selectedTitleIndex: Int = 0
}

struct ContentView: View {
    @State var cardViewIdx: Int = 0
    @State var cardDecriptionIdx: Int = 0
    @State var showingOptions = false
    @State var isButtonChangeBulletPressed = false
    @State var isButtonChangeCardTitle = false
    @ObservedObject var cardData = CardData()
    
    //Card image Array
    let cardViewImages: [UIImage] = [UIImage(imageLiteralResourceName: "1"),
                                     UIImage(imageLiteralResourceName: "2"),
                                     UIImage(imageLiteralResourceName: "3")]

    let CardDecription: [[String]] = [   [
        "defines the behavior for common VCs",
        "updates the content of the view",
        "responding to user interactions",
        "resizing views and layout mgmnt",
        "coordinating with other objects",
    ],
        [
        "provides required IOS infrastructure",
       "window and view architecture",
        "event handling for multi-touch and etc",
        "manages interaction with system",
        "a lot of features incl. resource mgmnt",
    ],   [
        "configure alerts and action sheets",
        "intended to be used as-is",
        "does not support subclassing",
        "inherits from UIViewController",
        "support text fields to the alert interface",
        
    ]]
    
    var body: some View {
        NavigationView {
                VStack {
                    Text("CardHub").font(.title.bold())
                    Image(uiImage: cardViewImages[cardViewIdx]).resizable().frame(width: 90, height: 90)
                    
                    // this zstack has two rectangles the smaller rectangle has the title text overlayed over it
                    // the bigger rectangle is where the description of each card is overlayed over the rectangle
                    ZStack(alignment: .top){
                        Rectangle().fill(Color(hex: 0xb4bec8)).frame(width: 330, height: 270).overlay(VStack(alignment: .leading, spacing: 12){
                            
                            ForEach(CardDecription[cardDecriptionIdx], id: \.self) { description in
                                Text("☆ "+description).font(.system(size: 18))
                            }
                        }).offset(y:15)
                        
                        Rectangle().frame(width: 330, height: 55)
                            .foregroundColor(Color(hex: 0xf2671c)).overlay(Text("Card: "+cardData.cardTitle[cardData.selectedTitleIndex])
                                .font(.title.bold()).multilineTextAlignment(.leading).foregroundColor(.white)
                            )
                    }
                    Spacer()
                    // The three differnt buttons
                    Button(action: nextCard) {
                        Text("Next Card").font(.title.bold()).frame(width: 300, height: 40)
                    }.buttonStyle(.borderedProminent).tint(Color(hex: 0xf2671c))
                        .buttonBorderShape(.roundedRectangle(radius: 1))
                    
                    Button(action: CardSelect) {
                        Text("Card Selector").font(.title.bold()).frame(width: 300, height: 40)
                    }.buttonStyle(.borderedProminent).tint(Color(hex: 0x9d785f))
                        .buttonBorderShape(.roundedRectangle(radius: 1)).confirmationDialog("Select Card", isPresented: $showingOptions, titleVisibility: .visible){
                            ForEach(cardData.cardTitle, id: \.self){ title in
                                Button(title){
                                    cardData.selectedTitleIndex = cardData.cardTitle.firstIndex(of: title)!
                                    cardDecriptionIdx = cardData.selectedTitleIndex
                                    cardViewIdx = cardData.selectedTitleIndex
                                }
                            }
                        }
                    Button(action: addBulletToCurrentCard) {
                        Text("Add Bullet").font(.title.bold()).frame(width: 300, height: 40)
                    }.buttonStyle(.borderedProminent).tint(Color(hex: 0xeec292))
                        .buttonBorderShape(.roundedRectangle(radius: 1)).sheet(isPresented: $isButtonChangeBulletPressed, content:{EditCardDescripRepresentable(switchBackToHome: .constant(false))
                            
                        })
                    
                    
                    Button(action: chnageCurrentTitle) {
                        Text("Edit card name").font(.title.bold()).frame(width: 300, height: 40)
                    }.buttonStyle(.borderedProminent).tint(Color(hex: 0xeec292))
                        .buttonBorderShape(.roundedRectangle(radius: 1))
                        .sheet(isPresented: $isButtonChangeCardTitle, content: {
                            EditTitleTextViewRepresentable(switchBackToHome: .constant(false), cardData: cardData)
                        })
                }
                .padding()
            
        }
        }

    // the functions for the three different functions
    func nextCard (){
        cardData.selectedTitleIndex=(cardData.selectedTitleIndex+1)%3
        cardViewIdx=cardData.selectedTitleIndex
        cardDecriptionIdx=cardData.selectedTitleIndex
        
    }
    func  addBulletToCurrentCard(){
        isButtonChangeBulletPressed.toggle()
    }
    func CardSelect(){
        showingOptions = true
    }
    func chnageCurrentTitle(){
        isButtonChangeCardTitle.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
    }
}
