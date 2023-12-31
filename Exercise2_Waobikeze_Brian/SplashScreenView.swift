//
//  SplashScreenView.swift
//  Exercise2_Waobikeze_Brian
//
//  Created by brian waobikeze on 9/4/23.
//

import SwiftUI

struct SplashScreenView: View {
    // variables to set the size and the opacity 
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    //First vstack is to determine hoiw long the splash will last until it enters the home screen
    // Second vstack imports the image in as well as set the size and the animations of the image and the title for the splash screen
    var body: some View {
        if isActive{
            ContentView()
        }else{
            VStack{
                VStack{
                    Image(uiImage: UIImage(imageLiteralResourceName: "imgbin_natsu-dragneel-erza-scarlet-fairy-tail-anime-logo-quiz-juvia-lockser-png")).font(.system(size: 20))
                    Text("Personal Flash Card App").font(.title.bold())
                }.scaleEffect(size)
                    .opacity(opacity)
                    .onAppear{
                        withAnimation(.easeIn(duration: 1.2)){
                            self.size = 0.9
                            self.opacity = 1.0
                        }
                    }
            }.onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                    self.isActive = true
                }
        }

        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
