//
//  ContentView.swift
//  Exercise2_Waobikeze_Brian
//
//  Created by brian waobikeze on 9/2/23.
//

import SwiftUI

struct ContentView: View {
    let cardViewImages: [UIImage] = [UIImage(imageLiteralResourceName: "1"), UIImage(imageLiteralResourceName: "2"), UIImage(imageLiteralResourceName: "3")]
    var body: some View {
        VStack {
            Text("CardHub").font(.title)
            Spacer()
                
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
