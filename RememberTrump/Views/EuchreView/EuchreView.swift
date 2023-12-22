//
//  EuchreView.swift
//  Euchre Helper
//
//  Created by Chad Wallace on 12/18/23.
//



import SwiftUI

struct ScaleButtonStyle : ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    } // end func some View
} // end struct ScaleButtonStyle


struct EuchreView: View {
    
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
    
    // **** State variable to control the plus/minus buttons popping up ****
    @State var minusButtonsOn = false
    
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
            
            VStack(){ // VStack 1 beginning
                
                HStack(alignment:.top){// for button row
                    
                    //**********************************************************
                    // Toggle button to subtract scores
                    //**********************************************************
                        
                        Button(action:  {
                            
                            minusButtonsOn.toggle()
                            
                        }) {
                            Image(systemName: "minus.square")
                                .resizable()
                                .frame(width: 40, height: 40)
                            Text("Fix")
                                .font(.title2)
                                .fontWeight(.semibold)
                                

                        }
                        .foregroundColor(minusButtonsOn ? Color("AccentColor").opacity(0.6) : Color("AccentColor gray"))
                        .buttonStyle(ScaleButtonStyle())
                        
                        Spacer()
                        
//                        HStack{// for Euchre! title
//
                                Image("Euchre! (3)")
                                    .resizable()
                                    .frame(width: 180.0, height: 80)
                                    .opacity(0.6)
                                    .padding(.all, -20)
//                                       }  // end Hstack for Euchre title

                    
                        Spacer()
                    
                        //**********************************************************
                        // Button to reset the scores to zero
                        //**********************************************************
                        
                        Button(action: {
                            
                            // reset scores to zero
                            usScore = 0
                            themScore = 0
                            minusButtonsOn = false
                            
                        }) {
                            Image(systemName: "arrow.counterclockwise.square")
                                .resizable()
                                .foregroundColor(Color("AccentColor gray"))
                                .frame(width: 40, height: 40)
                            Text("Reset")
                                .font(.title2)
                                .foregroundColor(Color("AccentColor gray"))
                                .fontWeight(.semibold)
                        }
                        .buttonStyle(ScaleButtonStyle())
                        
                    } // end HStack for button row
                    .padding(.leading, 40.0)
                    .padding(.trailing, 40.0)
                    .padding(.top, 10.0)
                    
                    HStack{ // for Scoring boxes
                        
                        Spacer()
                        
                        VStack{ // for Us Score
                            
                            if usScore == 10 {
                                Text("WINNER!")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundColor(.yellow)
                            }
                            else {
                                Text("US")
                                    .font(.largeTitle)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                            }
                            
                            Text(String(usScore))
                                .font(.largeTitle)
                                .foregroundColor(.black)
                                .padding(.bottom, -1.0)
                            
                            
                            // ****  Logic that if showMinusButtons = true, then show the HStack for minus buttons and hide the HStack for addition buttons. Else, if showMinusButtons = false, show the HStack for plus buttons and hide the HStack for  minus buttons.
                            
                            if minusButtonsOn == false {
                                
                                HStack{ // for usScore plus buttons  (I need on if minusButtonOn == false)
                                    
                                    Button() {
                                        if usScore < 10 { // Don't go above 10, which wins.
                                            usScore += 1
                                        }
                                    } label: {
                                        Image(systemName: "1.circle")
                                            .foregroundColor(Color("AccentColor blue"))
                                            .font(.title)
                                    }
                                    
                                    Button() {
                                        if usScore < 9 { // Don't go above 10, which wins.
                                            usScore += 2
                                        }
                                        else if usScore == 9 {
                                            usScore = 10 // don't go over 10, which wins.
                                        }
                                    } label: {
                                        Image(systemName: "2.circle")
                                            .foregroundColor(Color("AccentColor blue"))
                                            .font(.title)
                                    }
                                    
                                    Button() {
                                        if usScore < 7 { // Don't go above 10, which wins.
                                            usScore += 4
                                        }
                                        else if usScore >= 7 && usScore < 10 {
                                            usScore = 10
                                        }
                                    } label: {
                                        Image(systemName: "4.circle")
                                            .foregroundColor(Color("AccentColor blue"))
                                            .font(.title)
                                    }
                                } // end HStack for usScore plus buttons
                                .font(.title2)
                                
                            } // end if minusButtonsOn = false
                            else { // minusButtonsOn == true
                                
                                HStack{ // for usScore plus buttons
                                    
                                    Button() {
                                        // reset minus button
                                        minusButtonsOn = false
                                        
                                        // change score
                                        if usScore > 0 { // Don't go below 0.
                                            usScore -= 1
                                        }
                                        
                                    } label: {
                                        Image(systemName: "1.circle")
                                            .foregroundColor(Color("AccentColor").opacity(0.8))
                                            .font(.title)
                                    }
                                    
                                    Button() {
                                        // reset minus button
                                        minusButtonsOn = false
                                        
                                        // change score
                                        if usScore > 1 { // Don't go below 0.
                                            usScore -= 2
                                        }
                                        else if usScore == 1 {
                                            usScore = 0
                                        }
                                    } label: {
                                        Image(systemName: "2.circle")
                                            .foregroundColor(Color("AccentColor").opacity(0.8))
                                            .font(.title)
                                    }
                                    
                                    Button() {
                                        // reset minus button
                                        minusButtonsOn = false
                                        
                                        // change score
                                        if usScore > 3 { // Don't go below 0.
                                            usScore -= 4
                                        }
                                        else if usScore > 0 && usScore < 4 {
                                            usScore = 0
                                        }
                                    } label: {
                                        Image(systemName: "4.circle")
                                            .foregroundColor(Color("AccentColor").opacity(0.8))
                                            .font(.title)
                                    }
                                    
                                } // end HStack for plus buttons
                                .font(.title2)
                            } // end else
                        } // end VStack for us score
                        .padding(10.0)
                        .background(Color(red: 0.522, green: 0.635, blue: 0.714))
                        .cornerRadius(10) /// make the background rounded
                        .overlay( /// apply a rounded border
                            RoundedRectangle(cornerRadius: 10)
                                .inset(by: 1)
                                .stroke(.white, lineWidth: 1)
                        ) // end overlay for rounded border
                        
                        
                        Spacer()
                        
                        
                        VStack{ // for them score
                            if themScore == 10 {
                                
                                Text("Winner!")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundColor(.yellow)
                            }
                            else{
                                Text("THEM")
                                    .font(.largeTitle)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                            }
                            
                            Text(String(themScore))
                                .font(.largeTitle)
                                .foregroundColor(Color.black)
                                .padding(.bottom, -1.0)
                            
                            if minusButtonsOn == false {
                                HStack{ // HStack for plus buttons for themScore  (Do this if minusButtonsOn == false)
                                    
                                    Button() {
                                        if themScore < 10 { // Don't go above 10, which wins.
                                            themScore += 1
                                        }
                                    } label: {
                                        Image(systemName: "1.circle")
                                            .foregroundColor(Color("AccentColor blue"))
                                            .font(.title)
                                    }
                                    
                                    Button() {
                                        if themScore < 9 { // Don't go above 10, which wins.
                                            themScore += 2
                                        }
                                        else if themScore == 9 {
                                            themScore = 10 // don't go over 10, which wins.
                                        }
                                    } label: {
                                        Image(systemName: "2.circle")
                                            .foregroundColor(Color("AccentColor blue"))
                                            .font(.title)
                                    }
                                    
                                    Button() {
                                        if themScore < 7 { // Don't go above 10, which wins.
                                            themScore += 4
                                        }
                                        else if themScore >= 7 && themScore < 10 {
                                            themScore = 10
                                        }
                                    } label: {
                                        Image(systemName: "4.circle")
                                            .foregroundColor(Color("AccentColor blue"))
                                            .font(.title)
                                    }
                                    
                                } // end HStack for them score plus buttons
                                .font(.title2)
                            } // end if minusButtonsOn == false
                            else { // minusButtonsOn == true
                                
                                HStack{ // HStack for minus buttons for themScore
                                    
                                    Button() {
                                        // reset minus button
                                        minusButtonsOn = false
                                        
                                        // change score
                                        if themScore > 0 { // Don't go below 0.
                                            themScore -= 1
                                        }
                                    } label: {
                                        Image(systemName: "1.circle")
                                            .foregroundColor(Color("AccentColor").opacity(0.8))
                                            .font(.title)
                                    }
                                    
                                    Button() {
                                        // reset minus button
                                        minusButtonsOn = false
                                        
                                        // change score
                                        if themScore > 1 { // Don't go below 0.
                                            themScore -= 2
                                        }
                                        else if themScore == 1 {
                                            themScore = 0
                                        }
                                    } label: {
                                        Image(systemName: "2.circle")
                                            .foregroundColor(Color("AccentColor").opacity(0.8))
                                            .font(.title)
                                    }
                                    
                                    Button() {
                                        // reset minus button
                                        minusButtonsOn = false
                                        
                                        // change score
                                        if themScore > 3 { // Don't go below 0.
                                            themScore -= 4
                                        }
                                        else if themScore > 0 && themScore < 4 {
                                            themScore = 0
                                        }
                                    } label: {
                                        Image(systemName: "4.circle")
                                            .foregroundColor(Color("AccentColor").opacity(0.8))
                                            .font(.title)
                                    }
                                    
                                } // end HStack for them score minus buttons
                                .font(.title2)
                            } // end else minusButtonsOn == true
                            
                        } // end VStack for them score
                        .padding(10.0)
                        .background(Color(red: 0.522, green: 0.635, blue: 0.714))
                        .cornerRadius(10) /// make the background rounded
                        .overlay( /// apply a rounded border
                            RoundedRectangle(cornerRadius: 10)
                                .inset(by: 1)
                                .stroke(.white, lineWidth: 2)
                        )
                        
                        Spacer()
                        
                    } // end HStack for scoring boxes
                    .foregroundColor(.white)
                
                if minusButtonsOn == true {
                    
                    Text("Reduce a score.")
                        .foregroundColor(.black)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .padding(10.0)
                        .background(Color("AccentColor gray"))
                        .cornerRadius(10) /// make the background rounded
                        .overlay( /// apply a rounded border
                            RoundedRectangle(cornerRadius: 10)
                                .inset(by: 1)
                                .stroke(.white, lineWidth: 2)
                        ) // end overlay for rounded border
                }
                    
                    Spacer()
                    
                    Image(systemName: suit)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(suitColor)
                        .opacity(0.8)
                        .contrast(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                        .padding(.top, 20)
                        .padding(.bottom, -15)
                    
                    Spacer()
                    
                    Text("Current Trump")
                        .padding()
                        .font(.largeTitle)
                        .foregroundColor(Color("AccentColor gray"))
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    HStack{ // for various suits
                        
                        Spacer()
                        
                        Button() {
                            suit = club
                            suitColorType = "black"
                        } label: {
                            Image(systemName: club)
                                .foregroundColor(.black)
                                .opacity(0.9)
                        }
                        .buttonStyle(ScaleButtonStyle())
                        
                        Spacer()
                        
                        Button() {
                            suit = heart
                            suitColorType = "red"
                        } label: {
                            Image(systemName: heart)
                                .foregroundColor(.red)
                                .opacity(0.7)
                        }
                        .buttonStyle(ScaleButtonStyle())
                        
                        Spacer()
                        
                        Button() {
                            suit = spade
                            suitColorType = "black"
                        } label: {
                            Image(systemName: spade)
                                .foregroundColor(.black)
                                .opacity(0.9)
                        }
                        .buttonStyle(ScaleButtonStyle())
                        
                        Spacer()
                        
                        Button() {
                            suit = diamond
                            suitColorType = "red"
                        } label: {
                            Image(systemName: diamond)
                                .foregroundColor(.red)
                                .opacity(0.7)
                        } // end label
                        .buttonStyle(ScaleButtonStyle())
                        
                        Spacer()
                        
                    } // end HStack for various suits
                    .font(.largeTitle)
                    .padding(.bottom, 15)
                    
                    
                } // end VStack 1
            } // end ZStack
            
        } // end body: some View
    } // end struct View


#Preview {
    EuchreView()
}

