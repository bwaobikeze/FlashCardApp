//
//  ContentView.swift
//  Exercise2_Waobikeze_Brian
//
//  Created by brian waobikeze on 9/2/23.
//

import SwiftUI

struct ContentView: View {
     @State var cardViewIdx: Int = 0
    let cardViewImages: [UIImage] = [UIImage(imageLiteralResourceName: "1"), UIImage(imageLiteralResourceName: "2"), UIImage(imageLiteralResourceName: "3")]
    var body: some View {
        VStack {
            Text("CardHub").font(.title)
            Image(uiImage: cardViewImages[cardViewIdx]).resizable().frame(width: 90, height: 90)
            
            ZStack(alignment: .top){
                Rectangle().fill(.gray).frame(width: 330, height: 270)
                
                Rectangle().frame(width: 330, height: 50)
                    .foregroundColor(.cyan)
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
        
    }
    func randomCard(){
        
    }
    func CardSelect(){
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
