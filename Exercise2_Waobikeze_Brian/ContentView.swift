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
    let cardViewImages: [UIImage] = [UIImage(imageLiteralResourceName: "1"), UIImage(imageLiteralResourceName: "2"), UIImage(imageLiteralResourceName: "3")]
    let CardTitle: [String] = ["View Controller","UIKit","UIAlertController"]
    let CardDecription: [List] = [    List {
        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Content")/*@END_MENU_TOKEN@*/
        Text("defines the behavior for common VCs")
        Text("updates the content of the view")
        Text("responding to user interactions")
        Text("resizing views and layout mgmnt")
        Text("coordinating with other objects")
    },    List {
        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Content")/*@END_MENU_TOKEN@*/
        Text("provides required IOS infrastructure")
        Text("window and view architecture")
        Text("event handling for multi-touch and etc")
        Text("manages interaction with system")
        Text("a lot of features incl. resource mgmnt")
    },    List {
        Text("configure alerts and action sheets")
        Text("intended to be used as-is")
        Text("does not support subclassing")
        Text("inherits from UIViewController")
        Text("support text fields to the alert interface")
        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Content")/*@END_MENU_TOKEN@*/
    }]

    var body: some View {
        VStack {
            Text("CardHub").font(.title.bold())
            Image(uiImage: cardViewImages[cardViewIdx]).resizable().frame(width: 90, height: 90)
            
            ZStack(alignment: .top){
                Rectangle().fill(.gray).frame(width: 330, height: 270)
                
                Rectangle().frame(width: 330, height: 55)
                    .foregroundColor(.cyan).overlay(Text("Card: "+CardTitle[cardTitleidx])
                        .font(.title.bold()).multilineTextAlignment(.leading)
                    )
            }
            Spacer()
            Button(action: randomCard) {
                Text("Random Card").frame(width: 300, height: 40)
            }.buttonStyle(.borderedProminent).tint(.green)
                .buttonBorderShape(.roundedRectangle(radius: 1))
            Button(action: nextCard) {
                Text("Next Card").frame(width: 300, height: 40)
            }.buttonStyle(.borderedProminent).tint(.green)
                .buttonBorderShape(.roundedRectangle(radius: 1))
            Button(action: CardSelect) {
                Text("Card Selector").frame(width: 300, height: 40)
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
        
    }
    func randomCard(){
        cardTitleidx = Int.random(in: 0..<3)
        cardViewIdx = cardTitleidx
    }
    func CardSelect(){
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
