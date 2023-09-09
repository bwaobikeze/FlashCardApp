//
//  EditTitleTextView.swift
//  Exercise2_Waobikeze_Brian
//
//  Created by brian waobikeze on 9/8/23.
//

import SwiftUI

struct EditTitleTextView: View {
    @State var isAddTitleButton = false
    var body: some View {
        VStack{
            Text("Edit Topic").font(.title.bold())
           
            ZStack(alignment: .top){
                Rectangle().fill(Color(hex: 0xb4bec8)).frame(width: 330, height: 125)
                
                Rectangle().frame(width: 330, height: 55)
                    .foregroundColor(Color(hex: 0xf2671c))
            }
            Button(action:inputTitle) {
                Text("Save").font(.title.bold()).frame(width: 300, height: 40)
            }.buttonStyle(.borderedProminent).tint(Color(hex: 0x8e4235))
                .buttonBorderShape(.roundedRectangle(radius: 1))
            
            Button(action: goBacktoHomePage) {
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
    func inputTitle(){
        
    }
    func goBacktoHomePage(){
        
    }
}

struct EditTitleTextView_Previews: PreviewProvider {
    static var previews: some View {
        EditTitleTextView()
    }
}
