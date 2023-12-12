//
//  ContentView.swift
//  RememberTrump
//
//  Created by Chad Wallace on 12/11/23.
//

import SwiftUI

struct TrumpView: View {
    // added Git
    // added another line to see how git handles
    // and another
    // I may want to disable the idleTimer when the app starts up and turn it back on when the app closes.
    // I can use: [UIApplication sharedApplication].idleTimerDisabled = YES;
    // We may also want to disable autolock. Maybe have a logon screen where I describe that the user may want to disable the Auto-lock feature of their phone by going to "Settings" -> "Display & Brightness" -> "Auto-Lock" -> "Never"
    // The user may also want to decrease brightness of their screen on the same "Display & Brightness" screen to prolong their battery life while playing their card game.
    
    
    //*********************
    // Variables here
    //*********************
    
    let spade = "suit.spade.fill"
    let diamond = "suit.diamond.fill"
    let club = "suit.club.fill"
    let heart = "suit.heart.fill"
    @State var suit = "suit.club.fill"
    @State var suitColorType = "black"
    var suitColor: Color {
        switch suitColorType {
        case "black":
            return .black
        case "red":
            return .red
        default:
            return .black
        }
    }

    
    //*********************
    // End variables
    //*********************
    
    var body: some View {
        ZStack{
            Image("background-cloth")
                .resizable()
                .ignoresSafeArea()
            
            VStack(){
                
                Spacer()
                
                Image(systemName: suit)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(suitColor)
                    .padding(.horizontal, 40.0)



                Spacer()
                
                HStack{
                    Spacer()
                    Button() {
                        suit = club
                        suitColorType = "black"
                    } label: {
                        Image(systemName: club)
                            .foregroundColor(.black)
                    }
                    Spacer()
                    Button() {
                        suit = heart
                        suitColorType = "red"
                    } label: {
                        Image(systemName: heart)
                            .foregroundColor(.red)
                    }

                    Spacer()
                    Button() {
                        suit = spade
                        suitColorType = "black"
                    } label: {
                        Image(systemName: spade)
                            .foregroundColor(.black)
                    }
                    Spacer()
                    Button() {
                        suit = diamond
                        suitColorType = "red"
                    } label: {
                        Image(systemName: diamond)
                            .foregroundColor(.red)
                    }
                    Spacer()
                } // end HStack
                .font(.title)
                
            } // end VStack
            
        } // end ZStack
    } // end body: some View
    
    //********************
    // Functions are here
    //********************

    
    
} // end struct TrumpView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TrumpView()
    }
}
