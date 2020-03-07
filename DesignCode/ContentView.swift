//
//  ContentView.swift
//  DesignCode
//
//  Created by huluobo on 2020/3/2.
//  Copyright © 2020 huluobo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var show = false
    @State var cardViewState = CGSize.zero
    @State var showCard = false
    @State var bottomCardState = CGSize.zero
    @State var isFull = false
    
    var body: some View {
        ZStack {
            TitleView()
                .blur(radius: show ? 20 : 0)
                .opacity(showCard ? 0.4 : 1)
                .offset(y: showCard ? -200 : 0)
                .animation(Animation.default.delay(0.1))
            
            BackgroundCardView()
                .frame(width: showCard ? 300 : 340, height: 220)
                .background(Color("card3"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -400 : -40)
                .offset(cardViewState)
                .offset(y: showCard ? -180 : 0)
                .scaleEffect(showCard ? 1 : 0.9)
                .rotationEffect(.degrees(show ? 0 : 10))
                .rotationEffect(.degrees(showCard ? -10 : 0))
                .rotation3DEffect(.degrees(showCard ? 0 : 10), axis: (x: 10, y: 0, z: 0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.5))
            
            BackgroundCardView()
                .frame(width: 340, height: 220)
                .background(Color("card1"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -200 : -20)
                .offset(cardViewState)
                .offset(y: showCard ? -140 : 0)
                .scaleEffect(showCard ? 1 : 0.95)
                .rotationEffect(.degrees(show ? 0 : 5))
                .rotationEffect(.degrees(showCard ? -5 : 0))
                .rotation3DEffect(.degrees(showCard ? 0 : 5), axis: (x: 10, y: 0, z: 0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.3))
            
            CardView()
                .frame(width: showCard ? 375.0 : 340.0, height: 220.0)
                .background(Color.black)
                .clipShape(RoundedRectangle(cornerRadius: showCard ? 30 : 20, style: .continuous))
                .shadow(radius: 20)
                .offset(cardViewState)
                .offset(y: showCard ? -100 : 0)
                .blendMode(.hardLight)
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture {
                    self.showCard.toggle()
            }.gesture(
                DragGesture().onChanged {
                    self.cardViewState = $0.translation
                    self.show = true
                }
                .onEnded { _ in
                    self.cardViewState = .zero
                    self.show = false
                }
            )
            
            BottomCardView(show: $showCard)
                .offset(x: 0, y: showCard ? 360 : 1000)
                .offset(y: bottomCardState.height)
                .blur(radius: show ? 20 : 0)
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
                .gesture(
                    DragGesture().onChanged {
                        self.bottomCardState = $0.translation
                        if self.isFull {
                            self.bottomCardState.height += -300
                        }
                        if self.bottomCardState.height < -300 {
                            self.bottomCardState.height = -300
                        }
                    }
                    .onEnded { _ in
                        if self.bottomCardState.height > 50 {
                            self.showCard = false
                        }
                        if (self.bottomCardState.height < -100 && !self.isFull)
                            || (self.bottomCardState.height < -250 && self.isFull){
                            self.bottomCardState.height = -300
                            self.isFull = true
                        } else {
                            self.bottomCardState = .zero
                            self.isFull = false
                        }
                    }
                )
        
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct BackgroundCardView: View {
    var body: some View {
        VStack {
            Spacer()
        }
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding()
            Image("Background1")
            Spacer()
        }
    }
}
