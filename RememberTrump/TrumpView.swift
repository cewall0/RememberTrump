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
    
    //**** The images for the trump suits ****

    let spade = "suit.spade.fill"
    let diamond = "suit.diamond.fill"
    let club = "suit.club.fill"
    let heart = "suit.heart.fill"
    
    //**** The color for the trump suit for the trump suits ****
    
    @State var suit = "suit.club.fill"
    @State var suitColorType = "black"
    
    // suitColor changes the color of the suit depending on if we need red or black.
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

    // **** Two state variables to control the team scores ****
    @State var usScore = 0
    @State var themScore = 0
    
    // **** State variables to add to score *****
    @State var usPlusOne = false
    @State var usPlusTwo = false
    @State var usPlusFour = false
    @State var themPlusOne = false
    @State var themPlusTwo = false
    @State var themPlusFour = false
    
    //*********************
    // End variables
    //*********************
    
    var body: some View {
        ZStack{
            Image("background-cloth")
                .resizable()
                .ignoresSafeArea()
            
            VStack(){
                
                HStack{// for top button(s)
                    
                    Spacer()
                    
                    Image("Euchre!")
                        .frame(width: 260)
                    //                        .resizable()
                    //                        .scaledToFit()
                    //                        .aspectRatio(contentMode: .fit)
                    
                    Spacer()
                    
                    Button() {
                        
                        // reset scores to zero
                        usScore = 0
                        themScore = 0
                        
                    } label: {
                        Image(systemName: "arrowshape.turn.up.left.2")
                            .foregroundColor(Color(red: 1.0, green: 0.471, blue: 0.255))
                            .font(.largeTitle)
                    }
                    Spacer()
                    
                    // ************
                    //                    This code would make a blue button, but I didn't like it that well. The spacing was wonky.
                    // ************
                    
                    
                    //                    Button("RESET GAME") {
                    //                        usScore = 0
                    //                        themScore = 0
                    //                    }
                    //                    .foregroundColor(.white)
                    //                    .font(.headline)
                    //                    .frame(width: 110)
                    //                    .padding(8.0)
                    //                    .background(.blue)
                    //                    .cornerRadius(10) /// make the background rounded
                    //                    .overlay( /// apply a rounded border
                    //                        RoundedRectangle(cornerRadius: 10)
                    //                            .inset(by: 1)
                    //                            .stroke(.white, lineWidth: 1)
                    //                    )
                    
                }  // end Hstack for top buttons

                
                HStack{ // for Scoring boxes
                    
                    Spacer()
                    
                    VStack{ // for Us Score
                        
                        Text("US")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        Text(String(usScore))
                            .font(.largeTitle)
                            .foregroundColor(.black)
                            .padding(.bottom, -1.0)
                        
                        HStack{

                            Button("+1") {
                                usScore += 1
                            }
                            .padding(6.0)
                            .background(.blue)
                            .cornerRadius(10) /// make the background rounded
                            .overlay( /// apply a rounded border
                                RoundedRectangle(cornerRadius: 10)
                                    .inset(by: 1)
                                    .stroke(.white, lineWidth: 1)
                            )
                            
                            
                            Button("+2") {
                                usScore += 2
                            }
                            .padding(6.0)
                            .background(.blue)
                            .cornerRadius(10) /// make the background rounded
                            .overlay( /// apply a rounded border
                                RoundedRectangle(cornerRadius: 10)
                                    .inset(by: 1)
                                    .stroke(.white, lineWidth: 1)
                            )

                            Button("+4") {
                                usScore += 4
                            }
                            .padding(6.0)
                            .background(Color.blue)
                            .cornerRadius(10) /// make the background rounded
                            .overlay( /// apply a rounded border
                                RoundedRectangle(cornerRadius: 10)
                                    .inset(by: 1)
                                    .stroke(.white, lineWidth: 1)
                            )
    
                        }
                        .font(.headline)

                    } // end VStack for us score
                    .padding(6.0)
                    .background(Color(red: 0.522, green: 0.635, blue: 0.714))
                    .cornerRadius(10) /// make the background rounded
                    .overlay( /// apply a rounded border
                        RoundedRectangle(cornerRadius: 10)
                            .inset(by: 1)
                            .stroke(.white, lineWidth: 1)
                    )
                    
                    
                    
                    Spacer()
                    
                    
                    VStack{ // for them score

                        Text("THEM")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.black)
                        Text(String(themScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.black)
                            .padding(.bottom, -1.0)
                        
                        HStack{

                            Button("+1") {
                                themScore += 1
                            }
                            .padding(6.0)
                            .background(.blue)
                            .cornerRadius(10) /// make the background rounded
                            .overlay( /// apply a rounded border
                                RoundedRectangle(cornerRadius: 10)
                                    .inset(by: 1)
                                    .stroke(.white, lineWidth: 1)
                            )
                            
                            Button("+2") {
                                themScore += 2
                            }
                            .padding(6.0)
                            .background(.blue)
                            .cornerRadius(10) /// make the background rounded
                            .overlay( /// apply a rounded border
                                RoundedRectangle(cornerRadius: 10)
                                    .inset(by: 1)
                                    .stroke(.white, lineWidth: 1)
                            )

                            Button("+4") {
                                themScore += 4
                            }
                            .padding(6.0)
                            .background(.blue)
                            .cornerRadius(10) /// make the background rounded
                            .overlay( /// apply a rounded border
                                RoundedRectangle(cornerRadius: 10)
                                    .inset(by: 1)
                                    .stroke(.white, lineWidth: 1)
                            )
    
                        }
                        .font(.headline)
                    } // end VStack for them score
                    .padding(6.0)
                    .background(Color(red: 0.522, green: 0.635, blue: 0.714))
                    .cornerRadius(10) /// make the background rounded
                    .overlay( /// apply a rounded border
                        RoundedRectangle(cornerRadius: 10)
                            .inset(by: 1)
                            .stroke(.white, lineWidth: 1)
                    )
                    
                    Spacer()
                    
                } // end HStack for scoring
                .foregroundColor(.white)
                .padding(.bottom, 10.0)
            
                
                Spacer()
                
                Image(systemName: suit)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(suitColor)
                    .padding(.horizontal, 40.0)

                Spacer()
                              
                Image("TRUMP")
                
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
