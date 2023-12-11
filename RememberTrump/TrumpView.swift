//
//  ContentView.swift
//  RememberTrump
//
//  Created by Chad Wallace on 12/11/23.
//

import SwiftUI

struct TrumpView: View {
    
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
