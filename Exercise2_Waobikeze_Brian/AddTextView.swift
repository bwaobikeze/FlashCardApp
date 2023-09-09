//
//  AddTextView.swift
//  Exercise2_Waobikeze_Brian
//
//  Created by brian waobikeze on 9/8/23.
//

import SwiftUI

struct AddTextView: View {
    var body: some View {
        VStack{
            Text("Edit Description").font(.title.bold())
            
            ZStack(alignment: .top){
                Rectangle().fill(Color(hex: 0xb4bec8)).frame(width: 330, height: 125)
                
                Rectangle().frame(width: 330, height: 55)
                    .foregroundColor(Color(hex: 0xf2671c))
            }
            Button(action: inputDescription) {
                Text("Save").font(.title.bold()).frame(width: 300, height: 40)
            }.buttonStyle(.borderedProminent).tint(Color(hex: 0x8e4235))
                .buttonBorderShape(.roundedRectangle(radius: 1))
            
            Button(action: CancelGoBack) {
                Text("Cancel").font(.title.bold()).frame(width: 300, height: 40)
            }.buttonStyle(.borderedProminent).tint(Color(hex: 0xeec292))
                .buttonBorderShape(.roundedRectangle(radius: 1))
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
        }
        
    }
    func CancelGoBack(){
        
    }
    
    func inputDescription(){
        
    }
}

struct AddTextView_Previews: PreviewProvider {
    static var previews: some View {
        AddTextView()
    }
}
