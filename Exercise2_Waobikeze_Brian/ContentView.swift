//
//  ContentView.swift
//  Exercise2_Waobikeze_Brian
//
//  Created by brian waobikeze on 9/2/23.
//

import SwiftUI

struct ContentView: View {
     @State var cardViewIdx: Int = 0
    @State var cardTitleidx: Int = 0
    @State var cardDecriptionIdx: Int = 0
    let cardViewImages: [UIImage] = [UIImage(imageLiteralResourceName: "1"),
                                     UIImage(imageLiteralResourceName: "2"),
                                     UIImage(imageLiteralResourceName: "3")]
    
    let CardTitle: [String] = ["View Controller",
                               "UIKit",
                               "UIAlertController"]
    
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
        VStack {
            Text("CardHub").font(.title.bold())
            Image(uiImage: cardViewImages[cardViewIdx]).resizable().frame(width: 90, height: 90)
            
            ZStack(alignment: .top){
                Rectangle().fill(.gray).frame(width: 330, height: 270).overlay(VStack(alignment: .leading, spacing: 10){
                    
                    ForEach(CardDecription[cardDecriptionIdx], id: \.self) { description in
                        Text("☆ "+description)
                    }
                })
                
                Rectangle().frame(width: 330, height: 55)
                    .foregroundColor(.cyan).overlay(Text("Card: "+CardTitle[cardTitleidx])
                     .font(.title.bold()).multilineTextAlignment(.leading)
                    )
            }
            Spacer()
            Button(action: randomCard) {
                Text("Random Card").font(.title.bold()).frame(width: 300, height: 40)
            }.buttonStyle(.borderedProminent).tint(.green)
                .buttonBorderShape(.roundedRectangle(radius: 1))
            Button(action: nextCard) {
                Text("Next Card").font(.title.bold()).frame(width: 300, height: 40)
            }.buttonStyle(.borderedProminent).tint(.green)
                .buttonBorderShape(.roundedRectangle(radius: 1))
            Button(action: CardSelect) {
                Text("Card Selector").font(.title.bold()).frame(width: 300, height: 40)
            }.buttonStyle(.borderedProminent).tint(.green)
                .buttonBorderShape(.roundedRectangle(radius: 1))
            Spacer()
            Spacer()
        }
        .padding()
    }
    func nextCard (){
        cardTitleidx=(cardTitleidx+1)%3
        cardViewIdx=cardTitleidx
        cardDecriptionIdx=cardTitleidx
        
    }
    func randomCard(){
        cardTitleidx = Int.random(in: 0..<3)
        cardViewIdx = cardTitleidx
        cardDecriptionIdx=cardTitleidx
    }
    func CardSelect(){
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
